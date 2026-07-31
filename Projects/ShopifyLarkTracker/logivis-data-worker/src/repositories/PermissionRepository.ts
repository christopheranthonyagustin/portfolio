import { BaseRepository } from "./BaseRepository";

export class PermissionRepository extends BaseRepository {

	async getByRoleId(roleId: number) {

		const result = await this.db
			.prepare(`
				SELECT
					p.*
				FROM RolePermissions rp
				INNER JOIN Permissions p
					ON p.PermissionId = rp.PermissionId
				WHERE rp.RoleId = ?
				ORDER BY p.Name
			`)
			.bind(roleId)
			.all();

		return result.results;

	}

}
