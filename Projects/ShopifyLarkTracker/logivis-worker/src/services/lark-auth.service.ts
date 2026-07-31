import type { LarkAuthResponse } from "../models/lark-auth-response";

export class LarkAuthService {

	private token?: string;
	private expiresAt = 0;

	public async getTenantAccessToken(
		env: Env
	): Promise<string> {

		// Return cached token if still valid
		if (
			this.token &&
			Date.now() < this.expiresAt
		) {
			return this.token;
		}

		const response = await fetch(
			"https://open.larksuite.com/open-apis/auth/v3/tenant_access_token/internal",
			{
				method: "POST",
				headers: {
					"Content-Type": "application/json"
				},
				body: JSON.stringify({
					app_id: env.LARK_APP_ID,
					app_secret: env.LARK_APP_SECRET
				})
			});

		if (!response.ok) {
			throw new Error(
				`Lark Authentication failed (${response.status})`
			);
		}

		const result =
			await response.json() as LarkAuthResponse;

		if (result.code !== 0) {
			throw new Error(result.msg);
		}

		this.token =
			result.tenant_access_token;

		// refresh one minute early
		this.expiresAt =
			Date.now() + ((result.expire - 60) * 1000);

		return this.token;
	}
}

export const larkAuthService =
	new LarkAuthService();
