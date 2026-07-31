import { DatabaseContext } from "../database/DatabaseContext";
import { HealthRepository } from "../repositories/HealthRepository";

export class HealthService {

	static async getHealth(env: Env) {

		const context = new DatabaseContext(env);

		const repository = new HealthRepository(context);

		const dbTime = await repository.getServerTime();

		return {
			status: "Healthy",
			database: dbTime
		};
	}

}
