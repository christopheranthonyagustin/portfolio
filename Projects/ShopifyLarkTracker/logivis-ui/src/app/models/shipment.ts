export interface Shipment {

  recordId: string;

  orderNo: string;

  customerName: string;

  trackingNumber: string;

  courier: string;

  status: string;

  shipmentDate: string | null;

  lastUpdated: string | null;

  awbCreatedTime: string | null;

  remarks: string | null;

  hasException: boolean;

  owner: string;

  channel: string;

}
