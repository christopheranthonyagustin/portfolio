export interface ShipmentSync {
	shopifyId: number;
	orderNo: string;
	customerName?: string;
	channel?: string;
	trackingNo?: string;
	status?: string;
	isException: boolean;
	remarks?: string;
	orderCreatedDate?: Date;
	fulfillmentDate?: Date;
	lastUpdated: Date;
}
