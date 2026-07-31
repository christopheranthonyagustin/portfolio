export interface TrackOrderRequest {
	user_id: number;
	user_secret: string;

	tracking_no_list: string[];
	order_id_list: string[];
}
