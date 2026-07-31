import type { ShipmentQuery } from "../models/shipment-query";

import { shipmentService } from "../services/shipment.service";
import { corsHeaders } from "../utils/cors";
import { verifyJwt } from "../middleware/jwt";

export async function shipments(
	request: Request,
	env: Env
): Promise<Response> {

	try {

		// Verify JWT
		const user = await verifyJwt(request, env);

		console.log("Authenticated:", user.email);

		switch (request.method) {

			case "GET":
				return await getShipments(request, env);

			case "PUT":
				return await bulkUpdateShipments(request, env, user);

			default:
				return Response.json(
					{
						success: false,
						message: "Method Not Allowed"
					},
					{
						status: 405,
						headers: corsHeaders
					}
				);
		}

	}
	catch (error: any) {

		console.error(error);

		if (
			error.message === "Missing bearer token" ||
			error.code === "ERR_JWT_EXPIRED" ||
			error.code === "ERR_JWS_SIGNATURE_VERIFICATION_FAILED"
		) {
			return Response.json(
				{
					success: false,
					message: "Unauthorized"
				},
				{
					status: 401,
					headers: corsHeaders
				}
			);
		}

		return Response.json(
			{
				success: false,
				message: error?.message ?? "Internal Server Error"
			},
			{
				status: 500,
				headers: corsHeaders
			}
		);
	}
}

async function getShipments(
	request: Request,
	env: Env
): Promise<Response> {

	const url = new URL(request.url);

	const query: ShipmentQuery = {
		search: url.searchParams.get("search") ?? undefined,
		status: url.searchParams.get("status") ?? undefined,
		channel: url.searchParams.get("channel") ?? undefined
	};

	const data = await shipmentService.getTrackedShipments(
		env,
		query
	);

	return Response.json(data, {
		headers: corsHeaders
	});
}

async function bulkUpdateShipments(
	request: Request,
	env: Env,
	user: any
): Promise<Response> {

	await shipmentService.syncActiveShipments(env);

	return Response.json(
		{
			success: true,
			message: "Shipment synchronization completed."
		},
		{
			headers: corsHeaders
		}
	);

}
