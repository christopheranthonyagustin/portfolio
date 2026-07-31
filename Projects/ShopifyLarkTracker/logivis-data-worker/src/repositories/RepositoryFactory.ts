import { DatabaseContext } from "../database/DatabaseContext";
import { UserRepository } from "./UserRepository";
import { RoleRepository } from "./RoleRepository";
import { PermissionRepository } from "./PermissionRepository";
import { CompanyRepository } from "./CompanyRepository";
export class RepositoryFactory {

	private readonly context: DatabaseContext;

	constructor(env: Env) {
		this.context = new DatabaseContext(env);
	}

	get users(): UserRepository {
		return new UserRepository(this.context);
	}

	get roles(): RoleRepository {
		return new RoleRepository(this.context);
	}

	get permissions(): PermissionRepository {
		return new PermissionRepository(this.context);
	}

	get companies(): CompanyRepository {
		return new CompanyRepository(this.context);
	}

}
