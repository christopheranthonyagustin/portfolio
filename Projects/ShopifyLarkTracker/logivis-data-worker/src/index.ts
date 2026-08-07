import { HealthRoute } from "./routes/HealthRoute";
import { UserRoute } from "./routes/UserRoute";
import { AuthRoute } from "./routes/AuthRoute";
import { corsHeaders } from "./utils/cors";
import { CompaniesRoute } from "./routes/CompaniesRoute";

export default {

	async fetch(request: Request, env: Env): Promise<Response> {

		const url = new URL(request.url);

		if (request.method === "OPTIONS") {

			return new Response(null, {
				headers: corsHeaders
			});

		}

		switch (`${request.method}:${url.pathname}`) {

			case "GET:/api/health":
				return HealthRoute.execute(env);

			case "POST:/internal/auth/external":
				return AuthRoute.external(request, env);

			case "GET:/internal/users":
				return UserRoute.getAll(env);

			case "GET:/internal/user-management/users":
				return UserRoute.getUsers(request, env);

			case "PUT:/internal/user-management/users":
				return UserRoute.updateUser(request, env);

			case "GET:/internal/companies/parents":
				return CompaniesRoute.getParentCompanies(env);

			case "GET:/internal/companies":
				return CompaniesRoute.getChildCompanies(request, env);

			case "GET:/api/debug":
				{
					const tables = await env.DB
						.prepare("SELECT name FROM sqlite_master WHERE type='table'")
						.all();

					return Response.json(tables);
				}

		}

		// GET /internal/users/{id}
		if (
			request.method === "GET" &&
			url.pathname.startsWith("/internal/users/")
		) {

			const id = Number(
				url.pathname.split("/").pop()
			);

			return UserRoute.getById(env, id);

		}

		return Response.json(
			{
				error: "Not Found"
			},
			{
				status: 404,
				headers: corsHeaders
			}
		);

	}

} satisfies ExportedHandler<Env>;
