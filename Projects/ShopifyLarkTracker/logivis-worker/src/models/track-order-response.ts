export interface TrackOrderResponse {
	ret_code: number;
	message: string;
	data: TrackOrderData;
}

export interface TrackOrderData {
	orders: TrackOrder[];
	fail_list: FailedOrder[];
}

export interface TrackOrder {

	order_id: string;
	order_id_link: string;

	tracking_no: string;
	tracking_link: string;
	reverse_tracking_no: string;

	status: string;
	status_code: string;

	order_type: number;
	vas_info: any;

	base_info: BaseInfo;
	deliver_info: DeliverInfo;
	edd_info: EddInfo;
	fulfillment_info: FulfillmentInfo;
	parcel_info: ParcelInfo;
	sender_info: SenderInfo;
	sort_code_info: SortCodeInfo;

	routes: Route[];
}

export interface FailedOrder {
	order_id: string;
	tracking_no: string;
	ret_code: number;
	message: string;
}

export interface BaseInfo {
	product_id: number | null;
	service_type: number;
}

export interface DeliverInfo {
	branch_name: string | null;

	deliver_address_version: string | null;
	deliver_city: string | null;
	deliver_detail_address: string;
	deliver_district: string | null;

	deliver_email: string | null;
	deliver_instruction: string;

	deliver_latitude: string;
	deliver_longitude: string;

	deliver_name: string;
	deliver_phone: string;
	deliver_post_code: string;

	deliver_state: string | null;
	deliver_street: string;
	deliver_unit_no: string;

	kyc_name: string | null;
	kyc_phone: string | null;

	proof_of_delivery_list: any;
	slot_id: number | null;

	sls_branch_id: string | null;
	spx_branch_id: string | null;
}

export interface EddInfo {
	edd_min: number;
	edd_max: number;
}

export interface FulfillmentInfo {

	allow_mutual_check: number | null;
	allow_partial_delivery: number;
	allow_try_on: number | null;

	cb_flag: number | null;

	cod_amount: number | null;
	cod_collection: number | null;

	collect_type: number;
	insurance_collection: number;

	order_create_time: number | null;
	page_enter_time: number | null;

	payment_role: number;

	pickup_time: number;
	pickup_time_range: string;
	pickup_time_range_id: number;

	return_whs_id: number | null;
	voucher_code: string;
	whs_id: number | null;
}

export interface ParcelInfo {

	delivered_item_list: any;

	express_insured_value: number;

	item_list: ParcelItem[];

	parcel_height: number;
	parcel_item_name: string;
	parcel_item_quantity: number;
	parcel_item_type: string;

	parcel_length: number;
	parcel_value: number | null;
	parcel_weight: number;
	parcel_width: number;

	size_id: number | null;
}

export interface ParcelItem {

	item_category: string | null;
	item_id: number;

	item_name: string;
	item_picture: string;

	item_price: string;
	item_quantity: number;
	item_weight: string;
}

export interface SenderInfo {

	sender_address_version: string | null;
	sender_city: string | null;
	sender_detail_address: string;
	sender_district: string | null;

	sender_email: string;

	sender_latitude: string;
	sender_longitude: string;

	sender_name: string;
	sender_phone: string;
	sender_post_code: string;

	sender_state: string | null;
	sender_street: string;
	sender_unit_no: string;
}

export interface SortCodeInfo {
	r_first_sort_code: string;
	r_third_sort_code: string;
	return_first_sort_code: string;
}

export interface Route {
	status: string;
	status_code: string;
	message: string;
	timestamp: number;
	driver_name: string;
}
