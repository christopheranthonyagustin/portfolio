import { corsHeaders } from "../utils/cors";

export class CompaniesRoute {

	static async getParentCompanies(env: Env): Promise<Response> {

		const result = await env.DB
			.prepare(`
        SELECT
          CompanyId,
          Name
        FROM Companies
        WHERE ParentCompanyId IS NULL
        ORDER BY Name
      `)
			.all();

		return Response.json(result.results, {
			status: 200,
			headers: corsHeaders
		});

	}

	static async getChildCompanies(
		request: Request,
		env: Env
	): Promise<Response> {

		const url = new URL(request.url);

		const parentCompanyId = Number(
			url.searchParams.get("parent_company_id")
		);

		const result = await env.DB
			.prepare(`
			  SELECT
				CompanyId,
				Name
			  FROM Companies
			  WHERE ParentCompanyId = ?
			  ORDER BY Name
			`)
			.bind(parentCompanyId)
			.all();

		return Response.json(result.results, {
			status: 200,
			headers: corsHeaders
		});

	}

}
