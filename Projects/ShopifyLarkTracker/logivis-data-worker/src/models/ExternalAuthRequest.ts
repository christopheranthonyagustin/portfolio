export interface ExternalAuthRequest {

	provider: string;

	providerUserId: string;

	email: string;

	firstName: string;

	lastName: string;

	pictureUrl?: string;

}
