import { HealthService } from "../services/HealthService";
import { corsHeaders } from "../utils/cors";

export class HealthRoute {

	static async execute(env: Env): Promise<Response> {

		const result = await HealthService.getHealth(env);

		return Response.json(result, {
			status: 200,
			headers: corsHeaders
		});
	}

}
