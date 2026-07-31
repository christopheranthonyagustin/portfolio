import { health } from "./routes/health";
import { authenticate, records } from "./routes/lark";
import { shipments } from "./routes/shipments";
import { shipmentService } from "./services/shipment.service";
import { SpxService } from "./services/spx.service";
import { corsHeaders } from "./utils/cors";
import { shopify } from "./routes/shopify";
import { ShopifyService } from "./services/shopify.service";
import { ShipmentProcessor } from "./services/ShipmentProcessor";
import { larkBaseService } from "./services/lark-base.service";

export default {

	async fetch(
		request: Request,
		env: Env,
		ctx: ExecutionContext
	): Promise<Response> {

		const url = new URL(request.url);

		if (request.method === "OPTIONS") {

			return new Response(null, {
				headers: corsHeaders
			});

		}

		switch (url.pathname) {

			case "/api/health":
				return health(request, env);

			case "/api/lark/auth":
				return authenticate(request, env);

			case "/api/lark/records":
				return records(request, env);

			case "/api/shipments":
				return shipments(request, env);

			case "/api/spx/verify": {

				try {

					const service = new SpxService(env);

					const result = await service.verifyAccount();

					return Response.json(result, {
						headers: corsHeaders
					});

				} catch (error) {

					return Response.json(
						{
							error: error instanceof Error
								? error.message
								: "Unknown error"
						},
						{
							status: 500,
							headers: corsHeaders
						}
					);

				}

			}

			case "/api/spx/orders": {

				try {

					const service = new SpxService(env);

					const orderIds = url.searchParams.get("orderIds");
					const trackingNos = url.searchParams.get("trackingNos");

					console.log({
						orderIds,
						trackingNos,
						url: request.url
					});

					if (orderIds) {

						const result = await service.findShipmentByOrderIds(
							orderIds
								.split(",")
								.map(x => x.trim())
								.filter(Boolean)
								.map(x => x.startsWith("#") ? x : `#${x}`)
						);

						return Response.json(result, {
							headers: corsHeaders
						});

					}

					if (trackingNos) {

						const result = await service.findShipmentByTrackNos(
							trackingNos
								.split(",")
								.map(x => x.trim())
								.filter(Boolean)
						);

						return Response.json(result, {
							headers: corsHeaders
						});

					}

					return Response.json(
						{
							error: "Either 'orderIds' or 'trackingNos' query parameter is required."
						},
						{
							status: 400,
							headers: corsHeaders
						}
					);

				} catch (error) {

					return Response.json(
						{
							error: error instanceof Error
								? error.message
								: "Unknown error"
						},
						{
							status: 500,
							headers: corsHeaders
						}
					);

				}

			}

			case "/api/spx/tracking": {

				try {

					const service = new SpxService(env);

					const trackingNos = url.searchParams.get("trackingNos");

					if (!trackingNos) {

						return Response.json(
							{
								error: "'trackingNos' query parameter is required."
							},
							{
								status: 400,
								headers: corsHeaders
							}
						);

					}

					const result = await service.findShipmentByTrackNos(
						trackingNos
							.split(",")
							.map(x => x.trim())
							.filter(Boolean)
					);

					return Response.json(result, {
						headers: corsHeaders
					});

				} catch (error) {

					return Response.json(
						{
							error: error instanceof Error
								? error.message
								: "Unknown error"
						},
						{
							status: 500,
							headers: corsHeaders
						}
					);

				}

			}

			case "/api/spx/bulk-update": {

				try {

					const spxService = new SpxService(env);

					const result = await spxService.bulkUpdate();

					return Response.json(result, {
						headers: corsHeaders
					});

				} catch (error) {

					return Response.json(
						{
							success: false,
							error: error instanceof Error
								? error.message
								: "Unknown error"
						},
						{
							status: 500,
							headers: corsHeaders
						}
					);

				}

			}

			case "/api/shopify/import": {

				ctx.waitUntil(
					(async () => {
						try {
							await shipmentService.importShopifyOrders(env);
						} catch (error) {
							console.error("Shopify import failed", error);
						}
					})()
				);

				return Response.json(
					{
						success: true,
						message: "Shopify import started."
					},
					{
						headers: corsHeaders
					}
				);
			}

			default:

				return Response.json(
					{
						error: "Not Found"
					},
					{
						status: 404,
						headers: corsHeaders
					}
				);

		}

	},

	async scheduled(
		controller: ScheduledController,
		env: Env,
		ctx: ExecutionContext
	): Promise<void> {

		const triggeredAt = new Date(controller.scheduledTime).toISOString();
		const executedAt = new Date().toISOString();

		console.log("======================================");
		console.log("Scheduled Job");
		console.log(`Cron         : ${controller.cron}`);
		console.log(`Triggered At : ${triggeredAt}`);
		console.log(`Executed At  : ${executedAt}`);
		console.log("======================================");

		try {

			switch (controller.cron) {

				// Every hour
				case "0 * * * *":

					console.log("Running SPX Shipment Synchronization...");
					await shipmentService.syncActiveShipments(env);
					break;

				// Daily 2:00 AM Singapore
				case "0 18 * * *":

					console.log("Running Shopify Order Import...");
					await shipmentService.importShopifyOrders(env);
					break;

				default:

					console.log(`No scheduled job mapped for cron: ${controller.cron}`);
					break;
			}

		} catch (error) {

			console.error("Scheduled Job Failed", error);

		}

	}

} satisfies ExportedHandler<Env>;
