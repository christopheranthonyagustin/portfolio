import { TrackOrderResponse } from "./track-order-response";

export interface BulkUpdateResponse {

  success: boolean;

  totalRecords: number;

  totalOrders: number;

  totalBatches: number;

  results: TrackOrderResponse[];

}
