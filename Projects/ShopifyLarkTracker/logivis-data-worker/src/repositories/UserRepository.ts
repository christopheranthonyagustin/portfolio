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

		const user = await this.db
			.prepare(`
			SELECT
				u.*,

				CASE
					WHEN assigned.ParentCompanyId IS NULL
						THEN assigned.CompanyId
					ELSE parent.CompanyId
				END AS CompanyId,

				CASE
					WHEN assigned.ParentCompanyId IS NULL
						THEN assigned.Name
					ELSE parent.Name
				END AS CompanyName

			FROM Users u

			INNER JOIN Companies assigned
				ON assigned.CompanyId = u.CompanyId

			LEFT JOIN Companies parent
				ON parent.CompanyId = assigned.ParentCompanyId

			WHERE u.UserId = ?
		`)
			.bind(id)
			.first<any>();

		console.log("========================================");
		console.log("UserRepository.getById()");
		console.log("========================================");
		console.log(JSON.stringify(user, null, 2));

		return user;

	}

	async getUsersByCompanyId(companyId: number) {

		const result = await this.db
			.prepare(`
        SELECT
            u.UserId,
            u.DisplayName,
            u.Email,
            u.CompanyId,
            c.Name AS CompanyName,
            r.RoleId,
            r.Code AS RoleCode,
            r.Name AS RoleName,
            CASE
                WHEN u.ProviderUserId LIKE 'ou_%' THEN 'Lark'
                WHEN u.ProviderUserId IS NOT NULL THEN 'Google'
                ELSE '-'
            END AS IdentityProvider,
            u.Status,
            u.LastLoginAt
        FROM Users u
        INNER JOIN Companies c
            ON c.CompanyId = u.CompanyId
        LEFT JOIN UserRoles ur
            ON ur.UserId = u.UserId
        LEFT JOIN Roles r
            ON r.RoleId = ur.RoleId
        WHERE u.CompanyId = ?
        ORDER BY u.DisplayName
    `)
			.bind(companyId)
			.all();

		return result.results;

	}

	async getByCompanyId(companyId: number) {

		console.log("========================================");
		console.log("UserRepository.getByCompanyId()");
		console.log("========================================");
		console.log("CompanyId:", companyId);

		const result = await this.db
			.prepare(`
			SELECT
				CompanyId,
				Name
			FROM Companies
			WHERE ParentCompanyId = ?
			ORDER BY Name
		`)
			.bind(companyId)
			.all();

		console.log("Companies:");
		console.log(JSON.stringify(result.results, null, 2));

		return result.results;

	}


	async getCurrentUser(providerUserId: string) {

		console.log("========================================");
		console.log("UserRepository.getCurrentUser()");
		console.log("========================================");
		console.log("ProviderUserId:", providerUserId);

		// -------------------------------------------------------
		// Load User
		// -------------------------------------------------------

		const user = await this.db
			.prepare(`
			SELECT
				u.UserId,
				u.CompanyId,
				u.Email,
				u.FirstName,
				u.LastName,
				u.DisplayName
			FROM Users u
			WHERE u.ProviderUserId = ?
		`)
			.bind(providerUserId)
			.first<any>();

		if (!user) {

			console.log("No matching user found.");

			return null;

		}

		// -------------------------------------------------------
		// Load Assigned Company
		// -------------------------------------------------------

		const assignedCompany = await this.db
			.prepare(`
			SELECT
				CompanyId,
				Name,
				ParentCompanyId
			FROM Companies
			WHERE CompanyId = ?
		`)
			.bind(user.CompanyId)
			.first<any>();

		if (!assignedCompany) {

			throw new Error("Assigned company not found.");

		}

		// -------------------------------------------------------
		// Resolve Parent Company
		// -------------------------------------------------------

		let parentCompany = assignedCompany;

		if (assignedCompany.ParentCompanyId != null) {

			const parent = await this.db
				.prepare(`
				SELECT
					CompanyId,
					Name
				FROM Companies
				WHERE CompanyId = ?
			`)
				.bind(assignedCompany.ParentCompanyId)
				.first<any>();

			if (!parent) {

				throw new Error("Parent company not found.");

			}

			parentCompany = parent;

		}

		// -------------------------------------------------------
		// Accessible Companies
		// -------------------------------------------------------

		let companies;

		if (assignedCompany.ParentCompanyId == null) {

			// Parent Company (Administrator)

			companies = await this.db
				.prepare(`
				SELECT
					CompanyId,
					Name
				FROM Companies
				WHERE ParentCompanyId = ?
				ORDER BY Name
			`)
				.bind(assignedCompany.CompanyId)
				.all();

		}
		else {

			// Child Company (Operator / Viewer)

			companies = await this.db
				.prepare(`
				SELECT
					CompanyId,
					Name
				FROM Companies
				WHERE CompanyId = ?
			`)
				.bind(assignedCompany.CompanyId)
				.all();

		}

		// -------------------------------------------------------
		// Roles
		// -------------------------------------------------------

		const roles = await this.db
			.prepare(`
			SELECT
				r.Code
			FROM UserRoles ur
			INNER JOIN Roles r
				ON r.RoleId = ur.RoleId
			WHERE
				ur.UserId = ?
				AND ur.Status = 'Active'
		`)
			.bind(user.UserId)
			.all();

		// -------------------------------------------------------
		// Permissions
		// -------------------------------------------------------

		const permissions = await this.db
			.prepare(`
			SELECT DISTINCT
				p.Code
			FROM UserRoles ur
			INNER JOIN RolePermissions rp
				ON rp.RoleId = ur.RoleId
			INNER JOIN Permissions p
				ON p.PermissionId = rp.PermissionId
			WHERE
				ur.UserId = ?
				AND ur.Status = 'Active'
		`)
			.bind(user.UserId)
			.all();

		// -------------------------------------------------------
		// Result
		// -------------------------------------------------------

		const result = {

			user: {
				id: user.UserId,
				email: user.Email,
				firstName: user.FirstName,
				lastName: user.LastName,
				displayName: user.DisplayName
			},

			company: {
				id: parentCompany.CompanyId,
				name: parentCompany.Name
			},

			companies: companies.results,

			roles: roles.results.map((r: any) => r.Code),

			permissions: permissions.results.map((p: any) => p.Code)

		};

		console.log("Current User Repositories:");
		console.log(JSON.stringify(result, null, 2));

		console.log("========================================");

		return result;

	}

	async createPendingExternalUser(request: ExternalAuthRequest) {

		const result = await this.db
			.prepare(`
      INSERT INTO Users (
        CompanyId,
        Email,
        FirstName,
        LastName,
        DisplayName,
        Status,
        ProviderUserId
      )
      VALUES (?, ?, ?, ?, ?, 'PendingApproval', ?)
    `)
			.bind(
				1, // Default Parent Company (S1) for now
				request.email,
				request.firstName,
				request.lastName,
				`${request.firstName} ${request.lastName}`.trim(),
				request.providerUserId
			)
			.run();

		const userId = result.meta.last_row_id as number;

		// Default Viewer role
		await this.db
			.prepare(`
      INSERT INTO UserRoles (
        UserId,
        ApplicationId,
        RoleId,
        Status
      )
      VALUES (?, 2, 5, 'Active')
    `)
			.bind(userId)
			.run();

		return userId;

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

	async updateUser(user: {
		UserId: number;
		CompanyId: number;
		RoleId: number;
		Status: string;
	}): Promise<void> {

		await this.db
			.prepare(`
			UPDATE Users
			SET
				CompanyId = ?,
				Status = ?,
				UpdatedAt = CURRENT_TIMESTAMP,
				UpdatedByUserId = ?
			WHERE UserId = ?
		`)
			.bind(
				user.CompanyId,
				user.Status,
				user.UserId, // TODO: Authenticated UserId
				user.UserId
			)
			.run();

	}

	async updateUserRole(user: {
		UserId: number;
		RoleId: number;
	}): Promise<void> {

		await this.db
			.prepare(`
			UPDATE UserRoles
			SET
				RoleId = ?,
				UpdatedAt = CURRENT_TIMESTAMP,
				UpdatedByUserId = ?
			WHERE UserId = ?
			  AND Status = 'Active'
		`)
			.bind(
				user.RoleId,
				user.UserId, // TODO: Authenticated UserId
				user.UserId
			)
			.run();

	}

}
