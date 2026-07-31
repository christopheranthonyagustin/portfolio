export interface TrackOrderResponse {
  ret_code: number;
  message: string;
  data: TrackOrder[];
}

export interface TrackOrder {
  order_id: string;
  tracking_no: string;
  delivery_status: string;
  awb_created_time: string;
}
