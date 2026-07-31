export interface VerifyAccountResponse {
	ret_code: number;
	message: string;
	data: {
		match_result: boolean;
	};
}
