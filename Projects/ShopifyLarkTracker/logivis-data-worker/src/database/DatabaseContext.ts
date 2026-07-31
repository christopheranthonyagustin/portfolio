export class DatabaseContext {

	constructor(
		private readonly env: Env
	) { }

	get db(): D1Database {
		return this.env.DB;
	}
}
