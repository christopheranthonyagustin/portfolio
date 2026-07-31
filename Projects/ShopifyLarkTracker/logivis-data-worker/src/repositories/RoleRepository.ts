import { BaseRepository } from "./BaseRepository";
import { Role } from "../models/Role";
export class RoleRepository extends BaseRepository {

	async getByUserId(userId: number): Promise<Role | null> {

		return await this.db
			.prepare(`
			SELECT
				r.*
			FROM UserRoles ur
			INNER JOIN Roles r
				ON r.RoleId = ur.RoleId
			WHERE ur.UserId = ?
			LIMIT 1
		`)
			.bind(userId)
			.first<Role>();

	}

}
