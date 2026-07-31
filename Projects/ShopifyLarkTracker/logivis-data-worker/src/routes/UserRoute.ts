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

		return Response.json(user, {
			status: 200,
			headers: corsHeaders
		});

	}

}
