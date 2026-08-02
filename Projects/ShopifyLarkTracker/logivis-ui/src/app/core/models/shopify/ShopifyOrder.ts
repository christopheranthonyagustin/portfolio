import { ShopifyCustomer } from "./ShopifyCustomer";
import { ShopifyShippingAddress } from "./ShopifyShippingAddress";
import { ShopifyFulfillment } from "./ShopifyFulfillment";
import { ShopifyLineItem } from "./ShopifyLineItem";

export interface ShopifyOrder {

	shopifyId: number;

	orderNumber: string;

	sourceName: string;

	status: string;

	createdAt: Date;

	customer: ShopifyCustomer | null;

	shippingAddress: ShopifyShippingAddress | null;

	lineItems: ShopifyLineItem[];

	fulfillments: ShopifyFulfillment[];
}


