import { larkAuthService } from "../services/lark-auth.service";
import { larkBaseService } from "../services/lark-base.service";
import { corsHeaders } from "../utils/cors";

export async function authenticate(
	request: Request,
	env: Env
): Promise<Response> {

	try {

		const token =
			await larkAuthService
				.getTenantAccessToken(env);

		return Response.json(
			{
				success: true,
				tokenLength: token.length,
				tokenPreview: token.substring(0, 12) + "...",
				cached: true
			},
			{
				headers: corsHeaders
			}
		);

	}
	catch (error: any) {

		return Response.json(
			{
				success: false,
				message: error.message
			},
			{
				status: 500,
				headers: corsHeaders
			}
		);

	}

}

export async function records(
	_request: Request,
	env: Env
): Promise<Response> {

	try {

		const data =
			await larkBaseService
				.listRecords(env);

		return Response.json(
			data,
			{
				headers: corsHeaders
			}
		);

	}
	catch (error: any) {

		return Response.json(
			{
				success: false,
				message: error.message
			},
			{
				status: 500,
				headers: corsHeaders
			}
		);

	}

}
