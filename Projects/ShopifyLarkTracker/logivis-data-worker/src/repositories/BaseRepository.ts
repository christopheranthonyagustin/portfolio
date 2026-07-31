import { DatabaseContext } from "../database/DatabaseContext";

export abstract class BaseRepository {

	protected readonly db: D1Database;

	constructor(context: DatabaseContext) {
		this.db = context.db;
	}

}
