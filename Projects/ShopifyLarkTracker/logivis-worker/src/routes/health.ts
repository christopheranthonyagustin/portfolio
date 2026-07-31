import { corsHeaders } from "../utils/cors";

export async function health(
	_request: Request,
	_env: Env
): Promise<Response> {

	return Response.json(

		{
			success: true,
			application: "LogiVis OMS",
			version: "1.0.0",
			environment: "Development",
			serverTime: new Date().toISOString()
		},

		{
			headers: corsHeaders
		}

	);

}
