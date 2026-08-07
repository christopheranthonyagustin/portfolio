import {
	ShopifyOrder,
	ShopifyCustomer,
	ShopifyShippingAddress,
	ShopifyFulfillment,
	ShopifyLineItem
} from "../models/shopify";



interface ShopifyOrdersResponse {
	orders: any[];
}
export class ShopifyService {

	constructor(
		private readonly env: Env
	) {
	}

	async getOrders(
		updatedAfter?: Date
	): Promise<ShopifyOrder[]> {

		console.log("Entered getOrders()");

		const store = this.env.SHOPIFY_STORE;
		const token = this.env.SHOPIFY_ACCESS_TOKEN;

		if (!store)
			throw new Error("SHOPIFY_STORE missing");

		if (!token)
			throw new Error("SHOPIFY_ACCESS_TOKEN missing");

		let url =
			`${store}/admin/api/2025-01/orders.json?status=any&limit=250`;

		if (updatedAfter) {

			url +=
				`&updated_at_min=${encodeURIComponent(
					updatedAfter.toISOString()
				)}`;
		}

		console.log(`SHOPIFY URL = ${url}`);

		const apiStart = Date.now();

		const response =
			await fetch(url, {
				method: "GET",
				headers: {
					"X-Shopify-Access-Token": token,
					"Accept": "application/json"
				}
			});

		console.log(
			`SHOPIFY API TIME = ${((Date.now() - apiStart) / 1000).toFixed(2)}s`
		);

		console.log(
			`SHOPIFY STATUS = ${response.status}`
		);

		if (!response.ok) {

			throw new Error(
				await response.text()
			);
		}

		const json =
			await response.text();

		console.log(
			`SHOPIFY RESPONSE SIZE = ${json.length.toLocaleString()} chars`
		);

		const parseStart =
			Date.now();

		const root =
			JSON.parse(json);

		const result: ShopifyOrder[] = [];

		const orders =
			root.orders ?? [];

		for (const order of orders) {

			result.push({

				shopifyId:
					Number(order.id) || 0,

				orderNumber:
					String(order.order_number ?? ""),

				sourceName:
					String(order.source_name ?? ""),

				status:
					order.fulfillment_status ??
					"unknown",

				createdAt:
					order.created_at
						? new Date(order.created_at)
						: new Date(),

				customer:
					this.extractCustomer(order),

				shippingAddress:
					this.extractShippingAddress(order),

				lineItems:
					this.extractLineItems(order),

				fulfillments:
					this.extractFulfillments(order)

			});
		}

		console.log(
			`Loaded ${result.length} Shopify orders`
		);

		console.log(`Loaded ${result.length} Shopify orders`);

		const order15324 = result.find(
			x => x.orderNumber === "15324"
		);

		console.log(
			`Contains Order 15324: ${order15324 != null}`
		);

		if (order15324) {

			console.log("================================");
			console.log("Order 15324 Found");
			console.log("================================");

			console.log(JSON.stringify(order15324, null, 2));

		}

		console.log(
			`SHOPIFY PARSE TIME = ${((Date.now() - parseStart) / 1000).toFixed(2)}s`
		);

		return result;
	}

	async getOrderByOrderNo(
		orderIds: string
	): Promise<ShopifyOrder | null> {

		console.log("Entered getOrderByOrderNo()");

		const store = this.env.SHOPIFY_STORE;
		const token = this.env.SHOPIFY_ACCESS_TOKEN;

		if (!store)
			throw new Error("SHOPIFY_STORE missing");

		if (!token)
			throw new Error("SHOPIFY_ACCESS_TOKEN missing");

		const normalized =
			this.normalizeShopifyOrderNo(orderIds);

		const url =
			`${store}/admin/api/2025-01/orders.json?status=any&name=${encodeURIComponent(normalized)}&limit=1`;

		console.log(`SHOPIFY URL = ${url}`);

		const response =
			await fetch(url, {
				method: "GET",
				headers: {
					"X-Shopify-Access-Token": token,
					"Accept": "application/json"
				}
			});

		console.log(
			`SHOPIFY STATUS = ${response.status}`
		);

		if (!response.ok) {

			throw new Error(
				await response.text()
			);

		}

		const root = await response.json() as ShopifyOrdersResponse;

		const order =
			root.orders?.[0];

		if (!order) {

			console.log(`Order ${normalized} not found.`);

			return null;

		}

		return {

			shopifyId:
				Number(order.id) || 0,

			orderNumber:
				String(order.order_number ?? ""),

			sourceName:
				String(order.source_name ?? ""),

			status:
				order.fulfillment_status ??
				"unknown",

			createdAt:
				order.created_at
					? new Date(order.created_at)
					: new Date(),

			customer:
				this.extractCustomer(order),

			shippingAddress:
				this.extractShippingAddress(order),

			lineItems:
				this.extractLineItems(order),

			fulfillments:
				this.extractFulfillments(order)

		};

	}

	private normalizeShopifyOrderNo(
		orderNo: string
	): string {

		const value = orderNo.trim();

		if (!value) {
			return "";
		}

		let normalized =
			value.replace(/^#/, "");

		normalized =
			normalized.replace(/-\d+$/, "");

		return `#${normalized}`;

	}

	private extractCustomer(
		order: any
	): ShopifyCustomer | null {

		const customer =
			order.customer;

		if (!customer)
			return null;

		return {

			firstName:
				this.getString(customer, "first_name"),

			lastName:
				this.getString(customer, "last_name")

		};
	}

	private extractShippingAddress(
		order: any
	): ShopifyShippingAddress | null {

		const address =
			order.shipping_address;

		if (!address)
			return null;

		return {

			name:
				this.getString(address, "name"),

			phone:
				this.getString(address, "phone"),

			address1:
				this.getString(address, "address1"),

			address2:
				this.getString(address, "address2"),

			city:
				this.getString(address, "city"),

			province:
				this.getString(address, "province"),

			zip:
				this.getString(address, "zip"),

			country:
				this.getString(address, "country")

		};
	}

	private extractFulfillments(
		order: any
	): ShopifyFulfillment[] {

		const result: ShopifyFulfillment[] = [];

		const fulfillments =
			order.fulfillments ?? [];

		for (const f of fulfillments) {

			result.push({

				trackingNumber:
					this.getString(f, "tracking_number"),

				createdAt:
					this.getDate(f, "created_at")

			});
		}

		return result;
	}

	private extractLineItems(
		order: any
	): ShopifyLineItem[] {

		const result: ShopifyLineItem[] = [];

		const items = order.line_items ?? [];

		for (const item of items) {

			result.push({

				id:
					Number(item.id ?? 0),

				title:
					this.getString(item, "title"),

				sku:
					this.getString(item, "sku"),

				quantity:
					Number(item.quantity ?? 0),

				variantTitle:
					this.getString(item, "variant_title"),

				grams:
					Number(item.grams ?? 0),

				requiresShipping:
					Boolean(item.requires_shipping)

			});

		}

		return result;

	}

	private getDate(
		obj: any,
		property: string
	): Date {

		const value =
			obj?.[property];

		if (!value)
			return new Date();

		const date =
			new Date(value);

		if (isNaN(date.getTime()))
			return new Date();

		return date;
	}

	private getString(
		obj: any,
		property: string
	): string {

		const value =
			obj?.[property];

		if (
			value === undefined ||
			value === null
		) {
			return "";
		}

		return String(value);
	}

}
