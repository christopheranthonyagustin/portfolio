import type { Shipment } from "../models/shipments";
import type { ShipmentQuery } from "../models/shipment-query";

import { larkBaseService } from "./lark-base.service";
import { shipmentFactory } from "../factories/shipment.factory";
import { SpxService } from "./spx.service";
import { ShopifyService } from "./shopify.service";
import { ShipmentProcessor } from "./ShipmentProcessor";

const INVALID_TRACKING_NUMBERS = new Set([
	"",
	"PICKUP",
	"SELFCOLLECT"
]);

export class ShipmentService {

	public async getTrackedShipments(
		env: Env,
		query: ShipmentQuery
	): Promise<Shipment[]> {

		const result = await larkBaseService.listRecords(env);

		const allShipments: Shipment[] = result.data.items.map(
			(record: any): Shipment => shipmentFactory.create(record)
		);

		const excluded = allShipments.filter((s: Shipment) => {

			const trackingNumber =
				s.trackingNumber.trim().toUpperCase();

			return INVALID_TRACKING_NUMBERS.has(trackingNumber);

		});

		const tracked = allShipments.filter((s: Shipment) => {

			const trackingNumber =
				s.trackingNumber.trim().toUpperCase();

			return !INVALID_TRACKING_NUMBERS.has(trackingNumber);

		});

		// ==========================================================
		// Debug Statistics
		// ==========================================================

		console.log("");
		console.log("==================================================");
		console.log("Shipment API Statistics");
		console.log("==================================================");

		console.log("Total Records :", allShipments.length);
		console.log("Tracked       :", tracked.length);
		console.log("Excluded      :", excluded.length);

		// ----------------------------------------------------------
		// Courier Distribution
		// ----------------------------------------------------------

		const courierStats = tracked.reduce((acc, shipment) => {

			const courier =
				shipment.courier || "UNKNOWN";

			acc[courier] =
				(acc[courier] ?? 0) + 1;

			return acc;

		}, {} as Record<string, number>);

		console.log("");
		console.log("Courier Distribution");
		console.log(JSON.stringify(courierStats, null, 2));

		// ----------------------------------------------------------
		// Channel Distribution
		// ----------------------------------------------------------

		const channelStats = tracked.reduce((acc, shipment) => {

			const channel =
				shipment.channel || "UNKNOWN";

			acc[channel] =
				(acc[channel] ?? 0) + 1;

			return acc;

		}, {} as Record<string, number>);

		// ----------------------------------------------------------
		// Shipment Status Distribution
		// ----------------------------------------------------------

		const statusStats = tracked.reduce((acc, shipment) => {

			const status =
				shipment.status || "UNKNOWN";

			acc[status] =
				(acc[status] ?? 0) + 1;

			return acc;

		}, {} as Record<string, number>);

		console.log("");
		console.log("Status Distribution");
		console.log(JSON.stringify(statusStats, null, 2));

		// ----------------------------------------------------------
		// Tracking Number Pattern
		// ----------------------------------------------------------

		const patternStats = tracked.reduce((acc, shipment) => {

			const tracking =
				shipment.trackingNumber.trim();

			let pattern = "OTHER";

			if (/^SPX/i.test(tracking)) {

				pattern = "SPX";

			}
			else if (/^JT/i.test(tracking)) {

				pattern = "JT";

			}
			else if (/^SF/i.test(tracking)) {

				pattern = "SF";

			}
			else if (/^\d+$/.test(tracking)) {

				pattern = `NUMERIC (${tracking.length})`;

			}

			acc[pattern] =
				(acc[pattern] ?? 0) + 1;

			return acc;

		}, {} as Record<string, number>);

		/*console.log("");
		console.log("Tracking Number Pattern");
		console.table(patternStats);*/

		// ----------------------------------------------------------
		// Excluded Records
		// ----------------------------------------------------------

		if (excluded.length > 0) {

			console.log("");
			console.log("Excluded Records");

			excluded.forEach((shipment, index) => {

				console.log(
					`[${index + 1}] ${shipment.orderNo} | ${shipment.customerName} | ${shipment.trackingNumber} | ${shipment.courier} | ${shipment.status} | ${shipment.channel} | ${shipment.remarks}`
				);

			});

		}

		// ----------------------------------------------------------
		// Sample Records
		// ----------------------------------------------------------

		//console.log("");
		//console.log("First 10 Tracked Shipments");

		/*tracked.slice(0, 10).forEach((shipment, index) => {

			console.log(
				`[${index + 1}] ${shipment.orderNo} | ${shipment.customerName} | ${shipment.trackingNumber} | ${shipment.courier} | ${shipment.status} | ${shipment.channel}`
			);

		});
		
		console.log("==================================================");
		console.log("");
		*/
		let shipments = tracked;

		// ==========================================================
		// Search
		// ==========================================================

		if (query.search) {

			const keyword = query.search.toLowerCase();

			shipments = shipments.filter((shipment: Shipment) =>
				shipment.orderNo.toLowerCase().includes(keyword) ||
				shipment.customerName.toLowerCase().includes(keyword) ||
				shipment.trackingNumber.toLowerCase().includes(keyword)
			);

		}

		// ==========================================================
		// Status Filter
		// ==========================================================

		if (query.status) {

			shipments = shipments.filter((shipment: Shipment) =>
				shipment.status === query.status
			);

		}

		// ==========================================================
		// Channel Filter
		// ==========================================================

		if (query.channel) {

			shipments = shipments.filter((shipment: Shipment) =>
				shipment.channel === query.channel
			);

		}

		return shipments;

	}

	public async syncActiveShipments(
		env: Env
	): Promise<void> {

		const startedAt = new Date();

		console.log("");
		console.log("==================================================");
		console.log("SPX Shipment Synchronization");
		console.log("==================================================");
		console.log(`Started (UTC)   : ${startedAt.toISOString()}`);
		console.log(`Started (SGT)   : ${startedAt.toLocaleString("en-SG", {
			timeZone: "Asia/Singapore"
		})}`);
		console.log("");

		const shipments = await this.getTrackedShipments(env, {});

		const activeStatuses = new Set([
			"待揽收",
			"运输中"
		]);

		const activeShipments = shipments.filter(
			shipment =>
				shipment.courier === "SPX" &&
				activeStatuses.has(shipment.status)
		);

		console.log("Synchronization Scope");
		console.log(`Total Shipments : ${shipments.length}`);
		console.log(`Active SPX      : ${activeShipments.length}`);
		console.log("");

		if (activeShipments.length > 0) {

			console.table(
				activeShipments.map(s => ({
					Order: s.orderNo,
					Status: s.status,
					Tracking: s.trackingNumber
				}))
			);

		} else {

			console.log("No active SPX shipments found.");

		}

		if (activeShipments.length === 0) {

			const finishedAt = new Date();

			console.log("");
			console.log("==================================================");
			console.log("Synchronization Summary");
			console.log("==================================================");
			console.log("Processed : 0 shipment(s)");
			console.log("Updated   : 0 shipment(s)");
			console.log(`Finished  : ${finishedAt.toISOString()}`);
			console.log("==================================================");

			return;

		}

		const spxService = new SpxService(env);

		const result = await spxService.syncShipments(activeShipments);

		const finishedAt = new Date();

		console.log("");
		console.log("==================================================");
		console.log("Synchronization Summary");
		console.log("==================================================");
		console.log(`Processed : ${result.totalRecords} shipment(s)`);
		console.log(`Updated   : ${result.totalUpdates ?? "See SPX logs"} shipment(s)`);
		console.log(`Finished  : ${finishedAt.toISOString()}`);
		console.log("==================================================");

	}

	public async importShopifyOrders(
		env: Env
	): Promise<void> {

		const shopify = new ShopifyService(env);

		const orders = await shopify.getOrders();

		const larkDoc =
			await larkBaseService.listRecords(env);

		const processor =
			new ShipmentProcessor(
				env,
				larkBaseService
			);

		await processor.processAsync(
			orders,
			larkDoc
		);
	}

}

export const shipmentService = new ShipmentService();
