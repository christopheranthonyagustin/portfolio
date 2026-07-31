import { BaseRepository } from "./BaseRepository";
import { ExternalAuthRequest } from "../models/ExternalAuthRequest";
export class UserRepository extends BaseRepository {

	async getAll() {

		console.log("=== UserRepository.getAll ===");

		const sql = "SELECT * FROM Users";
		console.log(sql);

		const result = await this.db
			.prepare(sql)
			.all();

		console.log(result);

		return result;
	}

	async getById(id: number) {
		return await this.db
			.prepare(`
            SELECT
                u.*,
                c.Name AS CompanyName
            FROM Users u
            INNER JOIN Companies c
                ON c.CompanyId = u.CompanyId
            WHERE u.UserId = ?
        `)
			.bind(id)
			.first();
	}

	async getByCompanyId(userId: number) {

		const result = await this.db
			.prepare(`
            SELECT
                c.CompanyId,
                c.Name
            FROM Users u
            INNER JOIN Companies c
                ON c.ParentCompanyId = u.CompanyId
            WHERE u.UserId = ?
            ORDER BY c.Name
        `)
			.bind(userId)
			.all();

		return result.results;

	}

	async getCurrentUser(providerUserId: string) {

		console.log("========================================");
		console.log("UserRepository.getCurrentUser()");
		console.log("========================================");
		console.log("ProviderUserId:", providerUserId);


		const user = await this.db
			.prepare(`
			SELECT
				u.UserId,
				u.CompanyId,
				u.Email,
				u.FirstName,
				u.LastName,
				u.DisplayName,
				c.Name AS CompanyName
			FROM Users u
			INNER JOIN Companies c
				ON c.CompanyId = u.CompanyId
			WHERE u.ProviderUserId = ?
		`)
			.bind(providerUserId)
			.first();

		console.log("User Lookup Result:");
		console.log(JSON.stringify(user, null, 2));

		if (!user) {

			console.log("No matching user found.");

			const users = await this.db
				.prepare(`
				SELECT
					UserId,
					Email,
					ProviderUserId
				FROM Users
			`)
				.all();

			console.log("Users in database:");
			console.log(JSON.stringify(users.results, null, 2));

			return null;
		}

		const companies = await this.db
			.prepare(`
			SELECT
				CompanyId,
				Name
			FROM Companies
			WHERE ParentCompanyId = ?
			ORDER BY Name
		`)
			.bind(user.CompanyId)
			.all();

		console.log("Companies:");
		console.log(JSON.stringify(companies.results, null, 2));
		console.log("Loading roles for UserId:", user.UserId);

		const roles = await this.db
			.prepare(`
			SELECT r.Code
			FROM UserRoles ur
			INNER JOIN Roles r
				ON r.RoleId = ur.RoleId
			WHERE ur.UserId = ?
		`)
			.bind(user.UserId)
			.all();

		console.log("Roles:");
		console.log(JSON.stringify(roles.results, null, 2));
		console.log("Loading permissions for UserId:", user.UserId);

		const permissions = await this.db
			.prepare(`
			SELECT DISTINCT p.Code
			FROM UserRoles ur
			INNER JOIN RolePermissions rp
				ON rp.RoleId = ur.RoleId
			INNER JOIN Permissions p
				ON p.PermissionId = rp.PermissionId
			WHERE ur.UserId = ?
		`)
			.bind(user.UserId)
			.all();


		console.log("User:", JSON.stringify(user, null, 2));

		const result = {
			user: {
				id: user.UserId,
				email: user.Email,
				firstName: user.FirstName,
				lastName: user.LastName,
				displayName: user.DisplayName
			},
			company: {
				id: user.CompanyId,
				name: user.CompanyName
			},
			companies: companies.results,
			roles: roles.results.map((r: any) => r.Code),
			permissions: permissions.results.map((p: any) => p.Code)
		};

		console.log("Returning Result:");
		console.log(JSON.stringify(result, null, 2));

		console.log("========================================");

		return result;
	}

	async createPendingLarkUser(
		request: ExternalAuthRequest
	): Promise<number> {

		const result = await this.db
			.prepare(`
				INSERT INTO Users (
					CompanyId,
					Email,
					ProviderUserId,
					FirstName,
					LastName,
					DisplayName,
					Status
				)
				VALUES (?, ?, ?, ?, ?, ?, ?)
			`)
			.bind(
				1, // Default Company
				request.email,
				request.providerUserId,
				request.firstName,
				request.lastName,
				`${request.firstName} ${request.lastName}`.trim(),
				"PendingApproval"
			)
			.run();

		return result.meta.last_row_id as number;
	}

	async getCurrentUserByEmail(email: string) {

		const user = await this.db
			.prepare(`
			SELECT
				u.UserId,
				u.CompanyId,
				u.Email,
				u.FirstName,
				u.LastName,
				u.DisplayName,
				c.Name AS CompanyName
			FROM Users u
			INNER JOIN Companies c
				ON c.CompanyId = u.CompanyId
			WHERE LOWER(u.Email) = LOWER(?)
		`)
			.bind(email)
			.first();

		if (!user) {
			return null;
		}

		const companies = await this.db
			.prepare(`
			SELECT
				CompanyId,
				Name
			FROM Companies
			WHERE ParentCompanyId = ?
			ORDER BY Name
		`)
			.bind(user.CompanyId)
			.all();

		const roles = await this.db
			.prepare(`
			SELECT r.Code
			FROM UserRoles ur
			INNER JOIN Roles r
				ON r.RoleId = ur.RoleId
			WHERE ur.UserId = ?
		`)
			.bind(user.UserId)
			.all();

		const permissions = await this.db
			.prepare(`
			SELECT DISTINCT p.Code
			FROM UserRoles ur
			INNER JOIN RolePermissions rp
				ON rp.RoleId = ur.RoleId
			INNER JOIN Permissions p
				ON p.PermissionId = rp.PermissionId
			WHERE ur.UserId = ?
		`)
			.bind(user.UserId)
			.all();

		return {
			user: {
				id: user.UserId,
				email: user.Email,
				firstName: user.FirstName,
				lastName: user.LastName,
				displayName: user.DisplayName
			},
			company: {
				id: user.CompanyId,
				name: user.CompanyName
			},
			companies: companies.results,
			roles: roles.results.map((r: any) => r.Code),
			permissions: permissions.results.map((p: any) => p.Code)
		};
	}

	public async updateUserProfile(
		userId: number,
		request: ExternalAuthRequest
	): Promise<void> {

		await this.db.prepare(`
        UPDATE Users
        SET
            Email = CASE
                WHEN ? IS NOT NULL AND TRIM(?) <> '' THEN ?
                ELSE Email
            END,
            FirstName = CASE
                WHEN ? IS NOT NULL AND TRIM(?) <> '' THEN ?
                ELSE FirstName
            END,
            LastName = CASE
                WHEN ? IS NOT NULL AND TRIM(?) <> '' THEN ?
                ELSE LastName
            END,
            DisplayName = CASE
                WHEN ? IS NOT NULL AND TRIM(?) <> '' THEN ?
                ELSE DisplayName
            END,
            ProviderUserId = CASE
                WHEN ProviderUserId IS NULL OR TRIM(ProviderUserId) = ''
                THEN ?
                ELSE ProviderUserId
            END,
            LastLoginAt = CURRENT_TIMESTAMP,
            UpdatedAt = CURRENT_TIMESTAMP
        WHERE UserId = ?
    `)
			.bind(
				request.email, request.email, request.email,
				request.firstName, request.firstName, request.firstName,
				request.lastName, request.lastName, request.lastName,
				request.firstName, request.firstName, request.firstName,
				request.providerUserId,
				userId
			)
			.run();
	}

}
