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

		let companies = [];

		if (role?.RoleId === 2) {

			// Administrator: all child companies under the parent company
			companies = await repositories.users.getByCompanyId(user.CompanyId);

		}
		else {

			// Operator / Viewer: only the assigned company
			companies = [
				{
					CompanyId: user.AssignedCompanyId,
					Name: user.AssignedCompanyName
				}
			];

		}

		console.log("========================================");
		console.log("UserService.getById()");
		console.log("RoleId:", role?.RoleId);
		console.log("Companies:", JSON.stringify(companies, null, 2));
		console.log("========================================");

		return {
			...user,
			IsSuperUser: false,
			Companies: companies,
			Role: role,
			Permissions: permissions
		};

	}

	static async getUsersByCompanyId(
		env: Env,
		companyId: number
	) {

		const repositories = new RepositoryFactory(env);

		return await repositories.users.getUsersByCompanyId(
			companyId
		);

	}

	static async updateUser(
		env: Env,
		user: {
			UserId: number;
			CompanyId: number;
			RoleId: number;
			Status: string;
		}
	): Promise<void> {

		const repositories = new RepositoryFactory(env);

		await repositories.users.updateUser(user);

		await repositories.users.updateUserRole({
			UserId: user.UserId,
			RoleId: user.RoleId
		});

	}

}
