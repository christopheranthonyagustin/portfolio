export interface Shipment {

	recordId: string;

	orderNo: string;

	customerName: string;

	trackingNumber: string;

	courier: string;

	status: string;

	shipmentDate: string;

	lastUpdated: string;

	awbCreatedTime: string;

	remarks: string;

	hasException: boolean;

	owner: string;

	channel: string;

}
