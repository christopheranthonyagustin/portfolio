import { AuthService } from "../services/AuthService";
import { corsHeaders } from "../utils/cors";
import type { ExternalAuthRequest } from "../models/ExternalAuthRequest";

export class AuthRoute {

	static async external(
		request: Request,
		env: Env
	): Promise<Response> {

		const body = await request.json() as Partial<ExternalAuthRequest>;

		if (!body.provider) {
			return Response.json(
				{ error: "Provider is required." },
				{
					status: 400,
					headers: corsHeaders
				}
			);
		}

		if (!body.providerUserId) {
			return Response.json(
				{ error: "ProviderUserId is required." },
				{
					status: 400,
					headers: corsHeaders
				}
			);
		}

		// Email is optional for some providers (e.g. Lark QR Login)

		const authRequest: ExternalAuthRequest = {
			provider: body.provider.trim(),
			providerUserId: body.providerUserId.trim(),
			email: body.email?.trim() ?? "",
			firstName: body.firstName?.trim() ?? "",
			lastName: body.lastName?.trim() ?? "",
			pictureUrl: body.pictureUrl
		};


		const result = await AuthService.externalLogin(
			env,
			authRequest
		);

		return Response.json(result, {
			status: 200,
			headers: corsHeaders
		});



	}

}
