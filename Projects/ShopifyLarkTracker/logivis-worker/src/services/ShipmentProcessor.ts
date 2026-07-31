import { ExceptionEngine } from "./ExceptionEngine";
import { LarkBaseService, larkBaseService } from "./lark-base.service";
import { larkAuthService } from "./lark-auth.service";
import type { ShopifyOrder } from "../models/shopify";
import type { ShipmentSync } from "../models/ShipmentSync";
import type { ListRecordsResponse } from "../models/lark-record";

export interface BatchUpdateShopifyRecord {
	record_id: string;
	fields: Record<string, any>;
}

export class ShipmentProcessor {

	private readonly rules = new ExceptionEngine();

	constructor(
		private env: Env,
		private lark: LarkBaseService
	) {
	}

	public async processAsync(
		orders: ShopifyOrder[],
		larkDoc: ListRecordsResponse
	): Promise<void> {

		const runId = crypto.randomUUID();

		console.log(`Run ${runId} started`);
		console.log(`Processing ${orders.length} Shopify orders...`);

		const token =
			await larkAuthService.getTenantAccessToken(this.env);

		const items = larkDoc.data.items;

		const recordMap =
			this.buildRecordMap(items);

		console.log(
			`Loaded ${recordMap.size} existing Lark records`
		);

		const seen = new Set<string>();

		for (const order of orders) {

			const key =
				this.normalizeOrderNo(order.orderNumber);

			if (seen.has(key)) {

				console.warn(
					`Duplicate Shopify order: ${key}`
				);

			}

			seen.add(key);

		}

		// Batch collections
		const updates: BatchUpdateShopifyRecord[] = [];
		const creates: { fields: Record<string, any> }[] = [];

		for (const order of orders) {

			const shipment: ShipmentSync = {

				shopifyId:
					order.shopifyId,

				orderNo:
					order.orderNumber,

				channel:
					this.normalizeChannel(
						order.sourceName
					),

				customerName:
					order.shippingAddress?.name ??
					`${order.customer?.firstName ?? ""} ${order.customer?.lastName ?? ""}`.trim(),

				status:
					order.status,

				isException:
					false,

				orderCreatedDate:
					order.createdAt,

				lastUpdated:
					new Date()
			};

			if (order.fulfillments?.length > 0) {

				shipment.trackingNo =
					order.fulfillments[0].trackingNumber;

				shipment.fulfillmentDate =
					order.fulfillments[0].createdAt;

			}

			this.rules.evaluate(shipment);

			if (!this.normalizeOrderNo(shipment.orderNo)) {
				continue;
			}

			const recordId =
				recordMap.get(
					this.normalizeOrderNo(
						shipment.orderNo
					)
				);

			if (recordId) {

				updates.push({
					record_id: recordId,
					fields: this.buildUpdateFields(shipment)
				});

			}
			else {

				creates.push({
					fields: this.buildCreateFields(shipment)
				});

			}

		}

		const start = Date.now();

		await this.lark.batchUpdateRecordsShopify(
			this.env,
			token,
			updates
		);

		await this.lark.batchCreateRecords(
			this.env,
			token,
			creates
		);

		console.log(
			`Elapsed = ${Date.now() - start} ms`
		);

		console.log(
			`Updated ${updates.length} records`
		);

		console.log(
			`Created ${creates.length} records`
		);

		console.log(
			`Finished processing ${orders.length} orders`
		);

	}

	
	private buildRecordMap(items: any[]): Map<string, string> {

		const map = new Map<string, string>();

		for (const item of items) {

			const fields = item.fields;

			if (!fields) {
				console.warn(`Record ${item.record_id} has no fields.`);
				continue;
			}

			const rawOrderNo = fields["订单号"];
			const orderNo = this.normalizeOrderNo(rawOrderNo);

			if (!orderNo) {
				console.warn(
					`Record ${item.record_id} has blank OrderNo.`,
					rawOrderNo
				);
				continue;
			}

			if (map.has(orderNo)) {

				console.warn(
					`Duplicate OrderNo: ${orderNo}`,
					{
						recordId: item.record_id,
						rawOrderNo
					}
				);

				continue;
			}

			map.set(orderNo, item.record_id);

		}

		console.log(
			`Map Size = ${map.size}, Lark Records = ${items.length}`
		);

		return map;

	}


	private normalizeOrderNo(value: unknown): string {

		return value
			?.toString()
			.replace(/^#/, "")
			.trim() ?? "";

	}

	private normalizeChannel(
		source?: string
	): string {

		source =
			source?.trim().toLowerCase() ?? "";

		switch (source) {

			case "web":
				return "Online Store";

			case "pos":
				return "POS";

			default:
				return source;
		}

	}

	private async processOrderAsync(
		token: string,
		shipment: ShipmentSync,
		recordId?: string
	): Promise<void> {

		try {

			if (!recordId) {

				console.log(
					`CREATE -> ${shipment.orderNo}`
				);

				const fields = this.buildCreateFields(shipment);

				// TODO: Port CreateRecord
				await this.lark.createRecord(
					this.env,
					token,
					fields
				);

			}
			else {

				console.log(
					`UPDATE -> ${shipment.orderNo}`
				);

				const fields = this.buildUpdateFields(shipment);

				await this.lark.updateRecordShopify(
					this.env,
					token,
					recordId,
					fields
				);

			}

		}
		catch (ex) {

			console.error(
				`ERROR [${shipment.orderNo}]`,
				ex
			);

		}

	}

	private buildCreateFields(
		shipment: ShipmentSync
	): Record<string, any> {

		return {
			"订单号": shipment.orderNo,
			"客户名称": shipment.customerName ?? "",
			"快递单号": shipment.trackingNo ?? "",
			"运单号": shipment.shopifyId.toString(),
			"物流公司": this.getCourier(shipment.trackingNo),
			"签收状态": shipment.status?.trim() || "Pending",
			"多选": shipment.channel ? [shipment.channel] : [],
			"是否异常": shipment.isException ? "Yes" : "No",
			"发货日期": shipment.fulfillmentDate ?? shipment.orderCreatedDate,
			"AWB创建时间": shipment.fulfillmentDate ?? shipment.orderCreatedDate,
			"更新时间": shipment.lastUpdated.toISOString(),
			"备注": shipment.remarks ?? ""
		};

	}

	private buildUpdateFields(
		shipment: ShipmentSync
	): Record<string, any> {

		return {
			"订单号": shipment.orderNo,
			"客户名称": shipment.customerName ?? "",
			"发货日期":
				(shipment.fulfillmentDate ?? shipment.orderCreatedDate)?.toISOString(),
			"AWB创建时间":
				(shipment.fulfillmentDate ?? shipment.orderCreatedDate)?.toISOString(),
			"运单号":
				shipment.shopifyId.toString()
		};

	}

	private async runWithConcurrency(
		tasks: Array<() => Promise<void>>,
		concurrency: number
	): Promise<void> {

		console.log(
			`[Scheduler] Total Tasks = ${tasks.length}, Concurrency = ${concurrency}`
		);

		const executing: Promise<void>[] = [];

		let started = 0;

		for (const task of tasks) {

			started++;

			console.log(
				`[Scheduler] Starting Task ${started}/${tasks.length} | Active = ${executing.length}`
			);

			const promise = task().finally(() => {

				const index = executing.indexOf(promise);

				if (index >= 0) {
					executing.splice(index, 1);
				}

				console.log(
					`[Scheduler] Task Finished | Active = ${executing.length}`
				);

			});

			executing.push(promise);

			if (executing.length >= concurrency) {

				console.log(
					`[Scheduler] Waiting... Active = ${executing.length}`
				);

				await Promise.race(executing);

				console.log(
					`[Scheduler] Resumed | Active = ${executing.length}`
				);

			}

		}

		console.log(
			`[Scheduler] Waiting for remaining ${executing.length} tasks...`
		);

		await Promise.all(executing);

		console.log(
			`[Scheduler] All tasks completed.`
		);

	}

	private getCourier(
		trackingNo?: string
	): string {

		if (!trackingNo?.trim()) {
			return "To Ship";
		}

		trackingNo = trackingNo.trim().toUpperCase();

		if (
			trackingNo.startsWith("SPX") ||
			trackingNo.startsWith("SP")
		) {
			return "SPX";
		}

		if (
			trackingNo.startsWith("JT")
		) {
			return "J&T";
		}

		return "Unknown";

	}
}
