import { ShopifyService } from "../services/shopify.service";
import { corsHeaders } from "../utils/cors";

export async function shopify(
	request: Request,
	env: Env
): Promise<Response> {

	try {

		const service = new ShopifyService(env);

		const result = await service.getOrders();

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
