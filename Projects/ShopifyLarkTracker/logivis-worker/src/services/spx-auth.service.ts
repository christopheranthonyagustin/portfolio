export interface SpxAuthHeaders {
	timestamp: string;
	randomNum: string;
	checkSign: string;
}

export class SpxAuthService {

	async generateHeaders(
		env: Env,
		payload: string
	): Promise<SpxAuthHeaders> {

		const timestamp = Math.floor(Date.now() / 1000).toString();

		const randomNum = Math.floor(
			Math.random() * Number.MAX_SAFE_INTEGER
		).toString();

		const originalValue =
			`${env.SPX_APP_ID}_${timestamp}_${randomNum}_${payload}`;

		const signature = await this.generateSignature(
			env.SPX_SECRET_KEY,
			originalValue
		);

		return {
			timestamp,
			randomNum,
			checkSign: signature
		};
	}

	private async generateSignature(
		secretKey: string,
		value: string
	): Promise<string> {

		const encoder = new TextEncoder();

		const cryptoKey = await crypto.subtle.importKey(
			"raw",
			encoder.encode(secretKey),
			{
				name: "HMAC",
				hash: "SHA-256"
			},
			false,
			["sign"]
		);

		const signature = await crypto.subtle.sign(
			"HMAC",
			cryptoKey,
			encoder.encode(value)
		);

		return Array.from(new Uint8Array(signature))
			.map(x => x.toString(16).padStart(2, "0"))
			.join("");
	}
}
