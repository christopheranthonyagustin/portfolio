import { corsHeaders } from "../utils/cors";
import { UserService } from "../services/UserService";

export class UserRoute {

	static async getAll(env: Env): Promise<Response> {

		const users = await UserService.getUsers(env);

		return Response.json(users, {
			status: 200,
			headers: corsHeaders
		});

	}

	static async getById(env: Env, id: number): Promise<Response> {

		const user = await UserService.getById(env, id);

		if (!user) {
			return Response.json(
				{ message: "User not found." },
				{
					status: 404,
					headers: corsHeaders
				}
			);
		}

		console.log("========================================");
		console.log("UserRoute.getById()");
		console.log("========================================");
		console.log(JSON.stringify(user, null, 2));

		return Response.json(user, {
			status: 200,
			headers: corsHeaders
		});

	}

	static async getUsers(
		request: Request,
		env: Env
	): Promise<Response> {

		const url = new URL(request.url);

		const companyId = Number(
			url.searchParams.get("company_id")
		);

		if (!companyId) {

			return Response.json(
				{
					message: "company_id is required."
				},
				{
					status: 400,
					headers: corsHeaders
				}
			);

		}

		const users = await UserService.getUsersByCompanyId(
			env,
			companyId
		);

		return Response.json(users, {
			status: 200,
			headers: corsHeaders
		});

	}

	static async updateUser(
		request: Request,
		env: Env
	): Promise<Response> {

		try {

			const user = await request.json() as {
				UserId: number;
				CompanyId: number;
				RoleId: number;
				Status: string;
			};

			await UserService.updateUser(
				env,
				user
			);

			return Response.json(
				{
					success: true,
					message: "User updated successfully."
				},
				{
					status: 200,
					headers: corsHeaders
				}
			);

		}
		catch (error) {

			console.error(error);

			return Response.json(
				{
					success: false,
					message: String(error)
				},
				{
					status: 500,
					headers: corsHeaders
				}
			);

		}

	}

}
