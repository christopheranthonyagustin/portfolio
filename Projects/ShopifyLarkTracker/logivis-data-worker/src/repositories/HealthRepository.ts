import { BaseRepository } from "./BaseRepository";
import { DatabaseContext } from "../database/DatabaseContext";

export class HealthRepository extends BaseRepository {

	constructor(context: DatabaseContext) {
		super(context);
	}

	async getServerTime() {

		return await this.db
			.prepare("SELECT datetime('now') AS serverTime")
			.first();

	}

}
