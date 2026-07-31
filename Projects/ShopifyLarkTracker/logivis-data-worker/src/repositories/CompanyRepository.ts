import { BaseRepository } from "./BaseRepository";
import { Companies } from "../models/Companies";

export class CompanyRepository extends BaseRepository {

	async getByParentCompanyId(parentCompanyId: number): Promise<Companies[]> {

		return await this.db
			.prepare(`
			SELECT
				CompanyId,
				Name
			FROM Companies
			WHERE ParentCompanyId = ?
			ORDER BY Name
		`)
			.bind(parentCompanyId)
			.all<Companies>()
			.then(result => result.results);

	}

}
