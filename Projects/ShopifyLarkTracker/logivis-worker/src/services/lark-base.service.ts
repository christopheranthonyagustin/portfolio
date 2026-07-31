import type { ListRecordsResponse } from "../models/lark-record";
import { larkAuthService } from "./lark-auth.service";

export interface BatchUpdateRecord {
	record_id: string;
	fields: Record<string, any>;
}

export interface BatchUpdateShopifyRecord {
	record_id: string;
	fields: Record<string, any>;
}


interface LarkApiResponse {
	code: number;
	msg?: string;
	data?: unknown;
}

export class LarkBaseService {

	public async listRecords(
		env: Env
	): Promise<ListRecordsResponse> {

		const token =
			await larkAuthService.getTenantAccessToken(env);

		const items: any[] = [];

		let pageToken: string | undefined;

		do {

			const url = new URL(
				`https://open.larksuite.com/open-apis/bitable/v1/apps/${env.LARK_BASE_ID}/tables/${env.LARK_TABLE_ID}/records`
			);

			url.searchParams.set("page_size", "500");

			if (pageToken) {

				url.searchParams.set(
					"page_token",
					pageToken
				);

			}

			const response = await fetch(
				url.toString(),
				{
					method: "GET",
					headers: {
						Authorization: `Bearer ${token}`
					}
				}
			);

			if (!response.ok) {

				const body = await response.text();

				throw new Error(
					`Lark returned ${response.status}. ${body}`
				);

			}

			const result =
				await response.json() as ListRecordsResponse;

			items.push(
				...result.data.items
			);

			pageToken =
				result.data.has_more
					? result.data.page_token
					: undefined;

		}
		while (pageToken);

		return {
			data: {
				items
			}
		} as ListRecordsResponse;

	}

	public async batchUpdateRecords(
		env: Env,
		token: string,
		records: BatchUpdateRecord[]
	): Promise<void> {

		if (records.length === 0) {
			return;
		}

		// Lark supports up to 500 records per batch request
		const chunkSize = 500;

		for (let i = 0; i < records.length; i += chunkSize) {

			const chunk =
				records.slice(i, i + chunkSize);

			console.log(
				`Updating batch ${i / chunkSize + 1} (${chunk.length} records)...`
			);

			const response = await fetch(
				`https://open.larksuite.com/open-apis/bitable/v1/apps/${env.LARK_BASE_ID}/tables/${env.LARK_TABLE_ID}/records/batch_update`,
				{
					method: "POST",
					headers: {
						Authorization: `Bearer ${token}`,
						"Content-Type": "application/json"
					},
					body: JSON.stringify({
						records: chunk
					})
				}
			);

			const body =
				await response.text();

			let result: LarkApiResponse;

			try {

				result =
					JSON.parse(body);

			}
			catch {

				throw new Error(
					`Invalid Lark response: ${body}`
				);

			}

			if (!response.ok) {

				console.error(result);

				throw new Error(
					`Lark HTTP ${response.status}: ${result.msg ?? body}`
				);

			}

			if (result.code !== 0) {

				console.error(result);

				throw new Error(
					result.msg ?? "Lark batch update failed."
				);

			}

			console.log(
				`Batch ${i / chunkSize + 1} updated successfully.`
			);

		}

	}

	public async updateRecord(
		env: Env,
		token: string,
		recordId: string,
		fields: Record<string, any>
	): Promise<void> {

		const response = await fetch(
			`https://open.larksuite.com/open-apis/bitable/v1/apps/${env.LARK_BASE_ID}/tables/${env.LARK_TABLE_ID}/records/${recordId}`,
			{
				method: "PUT",
				headers: {
					Authorization: `Bearer ${token}`,
					"Content-Type": "application/json"
				},
				body: JSON.stringify({
					fields
				})
			}
		);

		if (!response.ok) {

			const body =
				await response.text();

			console.error(body);

			throw new Error(
				`Failed to update Lark record ${recordId}. ${body}`
			);

		}

	}

	public async createRecord(
		env: Env,
		token: string,
		fields: Record<string, any>
	): Promise<void> {


		const response = await fetch(
			`https://open.larksuite.com/open-apis/bitable/v1/apps/${env.LARK_BASE_ID}/tables/${env.LARK_TABLE_ID}/records`,
			{
				method: "POST",
				headers: {
					Authorization: `Bearer ${token}`,
					"Content-Type": "application/json"
				},
				body: JSON.stringify({
					fields
				})
			}
		);

		if (!response.ok) {

			const body =
				await response.text();

			console.error(body);

			throw new Error(
				`Failed to create Lark record. ${body}`
			);

		}

		const result =
			await response.json() as LarkApiResponse;

		if (result.code !== 0) {

			throw new Error(
				result.msg ?? "Failed to create Lark record."
			);

		}

	}

	public async updateRecordShopify(
		env: Env,
		token: string,
		recordId: string,
		fields: Record<string, any>
	): Promise<void> {

		const allowedFields: Record<string, any> = {};

		const allowed = [
			"客户名称",
			"发货日期",
			"运单号",
			"AWB创建时间"
		];

		for (const key of allowed) {
			if (key in fields) {
				allowedFields[key] = fields[key];
			}
		}

		const response = await fetch(
			`https://open.larksuite.com/open-apis/bitable/v1/apps/${env.LARK_BASE_ID}/tables/${env.LARK_TABLE_ID}/records/${recordId}`,
			{
				method: "PUT",
				headers: {
					Authorization: `Bearer ${token}`,
					"Content-Type": "application/json"
				},
				body: JSON.stringify({
					fields: allowedFields
				})
			}
		);

		if (!response.ok) {

			const body = await response.text();

			console.error(body);

			throw new Error(
				`Failed to update Shopify fields for record ${recordId}. ${body}`
			);

		}

		const result =
			await response.json() as LarkApiResponse;

		if (result.code !== 0) {

			throw new Error(
				result.msg ?? "Failed to update Shopify record."
			);

		}

	}

	public async batchCreateRecords(
		env: Env,
		token: string,
		records: { fields: Record<string, any> }[]
	): Promise<void> {

		if (records.length === 0) {
			return;
		}

		// Lark supports up to 500 records per batch request
		const chunkSize = 500;

		for (let i = 0; i < records.length; i += chunkSize) {

			const chunk =
				records.slice(i, i + chunkSize);

			console.log(
				`Creating batch ${i / chunkSize + 1} (${chunk.length} records)...`
			);

			const response = await fetch(
				`https://open.larksuite.com/open-apis/bitable/v1/apps/${env.LARK_BASE_ID}/tables/${env.LARK_TABLE_ID}/records/batch_create`,
				{
					method: "POST",
					headers: {
						Authorization: `Bearer ${token}`,
						"Content-Type": "application/json"
					},
					body: JSON.stringify({
						records: chunk
					})
				}
			);

			const body =
				await response.text();

			let result: LarkApiResponse;

			try {

				result =
					JSON.parse(body);

			}
			catch {

				throw new Error(
					`Invalid Lark response: ${body}`
				);

			}

			if (!response.ok) {

				console.error(result);

				throw new Error(
					`Lark HTTP ${response.status}: ${result.msg ?? body}`
				);

			}

			if (result.code !== 0) {

				console.error(result);

				throw new Error(
					result.msg ?? "Lark batch create failed."
				);

			}

			console.log(
				`Batch ${i / chunkSize + 1} created successfully.`
			);

		}

	}

	public async batchUpdateRecordsShopify(
		env: Env,
		token: string,
		records: BatchUpdateShopifyRecord[]
	): Promise<void> {

		if (records.length === 0) {
			return;
		}

		const chunkSize = 500;

		const allowed = [
			"客户名称",
			"发货日期",
			"运单号",
			"AWB创建时间"
		];

		for (let i = 0; i < records.length; i += chunkSize) {

			const chunk = records.slice(i, i + chunkSize);

			const filteredChunk = chunk.map(record => {

				const allowedFields: Record<string, any> = {};

				for (const key of allowed) {

					if (key in record.fields) {
						allowedFields[key] = record.fields[key];
					}

				}

				return {
					record_id: record.record_id,
					fields: allowedFields
				};

			});

			const response = await fetch(
				`https://open.larksuite.com/open-apis/bitable/v1/apps/${env.LARK_BASE_ID}/tables/${env.LARK_TABLE_ID}/records/batch_update`,
				{
					method: "POST",
					headers: {
						Authorization: `Bearer ${token}`,
						"Content-Type": "application/json"
					},
					body: JSON.stringify({
						records: filteredChunk
					})
				}
			);

			const body = await response.text();

			let result: LarkApiResponse;

			try {

				result = JSON.parse(body);

			}
			catch {

				throw new Error(
					`Invalid Lark response: ${body}`
				);

			}

			if (!response.ok) {

				console.error(result);

				throw new Error(
					`Lark HTTP ${response.status}: ${result.msg ?? body}`
				);

			}

			if (result.code !== 0) {

				console.error(result);

				throw new Error(
					result.msg ?? "Lark Shopify batch update failed."
				);

			}

			console.log(
				`Shopify batch ${i / chunkSize + 1} updated successfully.`
			);

		}

	}

}

export const larkBaseService =
	new LarkBaseService();
