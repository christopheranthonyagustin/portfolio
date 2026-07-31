import { RepositoryFactory } from "../repositories/RepositoryFactory";
import { ExternalAuthRequest } from "../models/ExternalAuthRequest";

export class AuthService {

	static async externalLogin(
		env: Env,
		request: ExternalAuthRequest
	) {

		console.log("ProviderUserId:", request.providerUserId);
		console.log("========================================");
		console.log("ExternalAuthRequest");
		console.log("========================================");
		console.log(JSON.stringify(request, null, 2));
		const repositories = new RepositoryFactory(env);
		const userRepository = repositories.users;

		let user = await userRepository.getCurrentUser(
			request.providerUserId
		);

		// 2. Not found? Try email
		if (!user && request.email) {

			user = await userRepository.getCurrentUserByEmail(request.email);

			if (user) {

				console.log("Existing user found by email. Linking Lark account...");

				await userRepository.updateUserProfile(
					user.user.id as number,
					request
				);

				// Reload using the newly linked ProviderUserId
				user = await userRepository.getCurrentUser(
					request.providerUserId
				);
			}
		}

		// 3. Still not found
		if (!user) {

			console.log("User not found. Creating Pending user...");

			await userRepository.createPendingLarkUser(request);

			return null;
		}

		// 4. Existing ProviderUserId login - refresh profile
		await userRepository.updateUserProfile(
			user.user.id as number,
			request
		);

		// Reload the latest profile
		user = await userRepository.getCurrentUser(
			request.providerUserId
		);

		console.log("Current User:", JSON.stringify(user, null, 2));

		return user;



	}
}
