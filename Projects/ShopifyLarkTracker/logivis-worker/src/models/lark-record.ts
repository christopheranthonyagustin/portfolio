// models/lark-record.ts

export interface LarkRecord {
    record_id: string;
    fields: Record<string, any>;
}

export interface ListRecordsResponse {
    data: {
		items: LarkRecord[];
		has_more: boolean;
		page_token?: string;
    };
}
