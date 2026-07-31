import { SpxAuthService } from "./spx-auth.service";
import { VerifyAccountRequest } from "../models/verify-account-request";
import { VerifyAccountResponse } from "../models/verify-account-response";
import { TrackOrderRequest } from "../models/track-order-request";
import { TrackOrderResponse } from "../models/track-order-response";
import { larkBaseService } from "./lark-base.service";
import { larkAuthService } from "./lark-auth.service";
import type { BatchUpdateRecord } from "../models/lark-batch";
import type { Shipment } from "../models/shipments";

export interface BulkUpdateResponse {
	success: boolean;
	totalRecords: number;
	totalOrders: number;
	totalBatches: number;
	totalUpdates: number;
	results: TrackOrderResponse[];
}
export class SpxService {

	constructor(
		private readonly env: Env,
		private readonly auth = new SpxAuthService()
	) { }

	public async verifyAccount(): Promise<VerifyAccountResponse> {

		const request: VerifyAccountRequest = {
			user_id: Number(this.env.SPX_USER_ID),
			user_secret: this.env.SPX_USER_SECRET
		};

		return this.post<
			VerifyAccountRequest,
			VerifyAccountResponse
		>(
			"/open/api/v1/account/verify",
			request
		);
	}

	public async findShipmentByOrderIds(
		orderIds: string[]
	): Promise<TrackOrderResponse> {

		const request: TrackOrderRequest = {
			user_id: Number(this.env.SPX_USER_ID),
			user_secret: this.env.SPX_USER_SECRET,
			tracking_no_list: [],
			order_id_list: orderIds
		};

		return this.post<
			TrackOrderRequest,
			TrackOrderResponse
		>(
			"/open/api/v1/order/batch_search_order",
			request
		);
	}

	public async findShipmentByTrackNos(
		trackingNos: string[]
	): Promise<TrackOrderResponse> {

		const request: TrackOrderRequest = {
			user_id: Number(this.env.SPX_USER_ID),
			user_secret: this.env.SPX_USER_SECRET,
			tracking_no_list: trackingNos,
			order_id_list: []
		};

		return this.post<
			TrackOrderRequest,
			TrackOrderResponse
		>(
			"/open/api/v1/order/batch_search_order",
			request
		);
	}

	public async syncShipments(
		shipments: Shipment[]
	): Promise<BulkUpdateResponse> {

		const updates: BatchUpdateRecord[] = [];

		const token =
			await larkAuthService.getTenantAccessToken(this.env);

		const orderIds = shipments
			.map(s => this.normalizeOrderId(s.orderNo));

		const batches =
			this.chunk(orderIds, 100);

		const results: TrackOrderResponse[] = [];

		for (const [index, batch] of batches.entries()) {

			console.log(
				`Processing batch ${index + 1}/${batches.length} (${batch.length} orders)...`
			);

			const response =
				await this.findShipmentByOrderIds(batch);

			results.push(response);

			if (response.ret_code !== 0) {

				console.error(
					`Batch ${index + 1} failed. Code: ${response.ret_code}`
				);

				continue;

			}

			const orders =
				response.data?.orders ?? [];

			for (const spxShipment of orders) {

				const shipment = shipments.find(s =>
					this.normalizeOrderId(s.orderNo) ===
					this.normalizeOrderId(spxShipment.order_id)
				);

				if (!shipment) {

					console.warn(
						`[NOT FOUND] ${spxShipment.order_id}`
					);

					continue;

				}

				const rawStatus = spxShipment.status ?? "";

				const newStatus = this.mapShipmentStatus(rawStatus);

				const newTracking = spxShipment.tracking_no ?? "";

				console.log(
					`[COMPARE] ${shipment.orderNo} | ` +
					`Current=${shipment.status} | ` +
					`Latest=${newStatus} (Raw=${rawStatus}) | ` +
					`Tracking=${shipment.trackingNumber} -> ${newTracking}`
				);

				// Skip if nothing changed

				if (
					shipment.status === newStatus &&
					shipment.trackingNumber === newTracking
				) {

					console.log(
						`[SKIP] ${shipment.orderNo}`
					);

					continue;

				}

				updates.push({
					record_id: shipment.recordId,
					fields: {
						"签收状态": newStatus,
						"快递单号": spxShipment.tracking_no ?? "",
						"运单号": spxShipment.tracking_no ?? "",
						"物流公司": "SPX"
					}
				});

			}

		}

		console.log(
			`Preparing to update ${updates.length} record(s)...`
		);

		if (updates.length > 0) {

			await larkBaseService.batchUpdateRecords(
				this.env,
				token,
				updates
			);

			console.log(
				`Successfully updated ${updates.length} record(s).`
			);

		}

		return {
			success: true,
			totalRecords: shipments.length,
			totalOrders: orderIds.length,
			totalBatches: batches.length,
			totalUpdates: updates.length,
			results
		};

	}

	public async bulkUpdate(): Promise<BulkUpdateResponse> {

		const records = await larkBaseService.listRecords(this.env);

		console.log(
			JSON.stringify(records.data.items[0], null, 2)
		);
		const sample =
			records.data.items.find(r =>
				this.text(r.fields["订单号"]).includes("14811")
			);

		console.log(
			JSON.stringify(sample, null, 2)
		);

		const larkRecords = records.data.items;

		const orderIds = this.extractOrderIds(larkRecords);

		const batches = this.chunk(orderIds, 100);

		const results = await this.processBatches(
			larkRecords,
			batches
		);

		return {
			success: true,
			totalRecords: larkRecords.length,
			totalOrders: orderIds.length,
			totalBatches: batches.length,
			totalUpdates: 0,
			results
		};

	}


	private extractOrderIds(records: any[]): string[] {

		return records
			.map(record => this.text(record.fields["订单号"]).trim())
			.filter(orderNo => orderNo.length > 0)
			.map(orderNo => {

				// SPX order IDs: #11358-1 -> 11358-1
				if (/^#?\d+-\d+$/.test(orderNo)) {
					return orderNo.replace(/^#/, "");
				}

				// Shopify order IDs: 14811 -> #14811
				return orderNo.startsWith("#")
					? orderNo
					: `#${orderNo}`;
			});

	}

	private normalizeOrderId(orderNo: string): string {

		const value = orderNo.trim();

		if (/^#?\d+-\d+$/.test(value)) {
			return value.replace(/^#/, "");
		}

		return value.startsWith("#")
			? value
			: `#${value}`;

	}

	private async processBatches(
		records: any[],
		batches: string[][]
	): Promise<TrackOrderResponse[]> {

		const results: TrackOrderResponse[] = [];
		const updates: BatchUpdateRecord[] = [];

		const token =
			await larkAuthService.getTenantAccessToken(this.env);

		for (const [index, batch] of batches.entries()) {

			const response =
				await this.processOrderBatch(
					index,
					batches.length,
					batch,
					records,
					updates
				);

			results.push(response);

		}

		await this.retryByTracking(
			records,
			updates
		);

		console.log(
			`Preparing to batch update ${updates.length} record(s)...`
		);

		if (updates.length > 0) {

			await larkBaseService.batchUpdateRecords(
				this.env,
				token,
				updates
			);

			console.log(
				`Successfully updated ${updates.length} record(s).`
			);

		}

		return results;

	}

	private async processOrderBatch(
		index: number,
		totalBatches: number,
		batch: string[],
		records: any[],
		updates: BatchUpdateRecord[]
	): Promise<TrackOrderResponse> {

		console.log(
			`Processing batch ${index + 1}/${totalBatches} (${batch.length} orders)...`
		);

		const response =
			await this.findShipmentByOrderIds(batch);

		if (response.ret_code !== 0) {

			console.error(
				`Batch ${index + 1} failed. ` +
				`Code: ${response.ret_code} | ${response.message}`
			);

			return response;
		}

		const orders =
			response.data?.orders ?? [];

		const failedOrders =
			response.data?.fail_list ?? [];

		console.log(
			`Batch ${index + 1} completed. ` +
			`${orders.length} order(s) found, ` +
			`${failedOrders.length} not found.`
		);

		for (const shipment of orders) {

			const normalizeOrderId = (value: string) =>
				value.replace(/^#/, "").trim();

			const record =
				records.find(r =>
					normalizeOrderId(this.text(r.fields["订单号"])) ===
					normalizeOrderId(shipment.order_id)
				);

			if (!record) {

				console.warn(
					`[LARK NOT FOUND] ${shipment.order_id}`
				);

				continue;

			}

			const currentStatus =
				this.text(record.fields["签收状态"]);

			const currentTracking =
				this.text(record.fields["快递单号"]);

			const newStatus =
				this.mapShipmentStatus(shipment.status);

			console.log(
				`[MATCH] ${shipment.order_id} | ` +
				`LarkStatus=${currentStatus} | ` +
				`SPXStatus=${shipment.status} | ` +
				`LarkTracking=${currentTracking} | ` +
				`SPXTracking=${shipment.tracking_no}`
			);

			console.log(
				`[QUEUE] ${shipment.order_id} -> ` +
				`Status=${newStatus}, ` +
				`Tracking=${shipment.tracking_no}`
			);

			updates.push({
				record_id: record.record_id,
				fields: {
					"签收状态": newStatus,
					"快递单号": shipment.tracking_no ?? "",
					"运单号": shipment.tracking_no ?? "",
					"物流公司": "SPX"
				}
			});

		}

		for (const failed of failedOrders) {

			console.warn(
				`[SPX NOT FOUND] ${failed.order_id} | ${failed.message}`
			);

		}

		return response;

	}

	private async retryByTracking(
		records: any[],
		updates: BatchUpdateRecord[]
	): Promise<void> {

		const retryTrackingNos =
			records
				.map(r => this.text(r.fields["快递单号"]))
				.filter(trackingNo => trackingNo.length > 0);

		console.log(
			`Retrying ${retryTrackingNos.length} shipment(s) by tracking number...`
		);

		if (retryTrackingNos.length === 0) {

			return;

		}

		const batchSize = 100;

		for (let i = 0; i < retryTrackingNos.length; i += batchSize) {

			const trackingBatch =
				retryTrackingNos.slice(i, i + batchSize);

			console.log(
				`Retrying tracking batch ${Math.floor(i / batchSize) + 1} ` +
				`(${trackingBatch.length} shipment(s))...`
			);

			const retryResponse =
				await this.findShipmentByTrackNos(trackingBatch);

			if (retryResponse.ret_code !== 0) {

				console.error(
					`Tracking retry failed. ` +
					`Code: ${retryResponse.ret_code} | ${retryResponse.message}`
				);

				continue;

			}

			const retryOrders =
				retryResponse.data?.orders ?? [];

			console.log(
				`[TRACKING BATCH] Requested=${trackingBatch.length}, Returned=${retryOrders.length}`
			);

			for (const shipment of retryOrders) {

				const record =
					records.find(r =>
						this.text(r.fields["快递单号"]) === shipment.tracking_no
					);

				if (!record) {

					console.warn(
						`[TRACKING NOT FOUND] ${shipment.tracking_no}`
					);

					continue;

				}

				const currentStatus =
					this.text(record.fields["签收状态"]);

				const currentTracking =
					this.text(record.fields["快递单号"]);

				const newStatus =
					this.mapShipmentStatus(shipment.status);

				console.log(
					`[MATCH BY TRACKING] ${shipment.tracking_no} | ` +
					`LarkStatus=${currentStatus} | ` +
					`SPXStatus=${shipment.status} | ` +
					`LarkTracking=${currentTracking} | ` +
					`SPXTracking=${shipment.tracking_no}`
				);

				console.log(
					`[QUEUE] ${shipment.tracking_no} -> ` +
					`Status=${newStatus}, ` +
					`Tracking=${shipment.tracking_no}`
				);

				updates.push({
					record_id: record.record_id,
					fields: {
						"订单号": shipment.order_id
							? `#${shipment.order_id.replace(/^#/, "")}`
							: "",
						"客户名称": shipment.deliver_info?.deliver_name ?? "",
						"签收状态": newStatus,
						"快递单号": shipment.tracking_no ?? "",
						"运单号": shipment.tracking_no ?? "",
						"物流公司": "SPX"
					}
				});

			}

		}

	}

	private mapShipmentStatus(status: string | null): string {

		switch (status) {

			case "Pending Pickup":
				return "待揽收";

			case "Picked Up":
				return "已揽收";

			case "In Transit":
				return "运输中";

			case "Out for Delivery":
			case "Delivering":
				return "派送中";

			case "Delivered":
				return "已签收";

			case "Failed Delivery":
				return "派送失败";

			case "Returned":
				return "已退回";

			case "Lost":
				return "遗失";

			case "Canceled":
				return "已取消";

			case "Exception":
				return "异常";

			default:
				return "未知";
		}
	}

	private chunk<T>(
		items: T[],
		size: number
	): T[][] {

		const batches: T[][] = [];

		for (let i = 0; i < items.length; i += size) {

			batches.push(
				items.slice(i, i + size)
			);

		}

		return batches;

	}

	private text(value: any): string {

		return String(value ?? "").trim();

	}



	private async post<TRequest, TResponse>(
		path: string,
		request: TRequest
	): Promise<TResponse> {

		const payload = JSON.stringify(request);

		const headers = await this.auth.generateHeaders(
			this.env,
			payload
		);

		const response = await fetch(
			`${this.env.SPX_BASE_URL}${path}`,
			{
				method: "POST",
				headers: {
					"Content-Type": "application/json",
					"app-id": this.env.SPX_APP_ID,
					"timestamp": headers.timestamp,
					"random-num": headers.randomNum,
					"check-sign": headers.checkSign
				},
				body: payload
			}
		);

		if (!response.ok) {
			throw new Error(`SPX returned ${response.status}`);
		}

		return (await response.json()) as TResponse;
	}
}
