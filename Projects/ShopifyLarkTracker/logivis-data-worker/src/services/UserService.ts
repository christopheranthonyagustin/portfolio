import { RepositoryFactory } from "../repositories/RepositoryFactory";

export class UserService {

	static async getUsers(env: Env) {

		const repositories = new RepositoryFactory(env);

		return await repositories.users.getAll();

	}

	static async getById(env: Env, id: number) {

		const repositories = new RepositoryFactory(env);

		const user = await repositories.users.getById(id);

		if (!user) {
			return null;
		}
		console.log("User ID:", user.UserId);
		if (user.UserId === 1) {

			return {
				...user,
				IsSuperUser: true,
				Role: null,
				Permissions: []
			};

		}

		const role = await repositories.roles.getByUserId(id);

		const permissions = role
			? await repositories.permissions.getByRoleId(role.RoleId)
			: [];

		const companies = await repositories.users.getByCompanyId(id);

		return {
			...user,
			IsSuperUser: false,
			Companies: companies,
			Role: role,
			Permissions: permissions
		};

	}

}
