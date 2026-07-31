import type { Shipment } from "../models/shipments";

export class ShipmentFactory {

	private text(value: any): string {

		return String(value ?? "").trim();

	}

	private person(value: any): string {

		if (Array.isArray(value))
			return value[0]?.name ?? "";

		return value?.name ?? "";

	}

	private bool(value: any): boolean {

		if (typeof value === "boolean")
			return value;

		return String(value)
			.toLowerCase() === "yes";

	}

	public create(record: any): Shipment {

		const f = record.fields ?? {};

		// Prefer 快递单号, otherwise use 运单号
		const trackingNumber =
			this.text(f["快递单号"]) ||
			this.text(f["运单号"]);

		const remarks =
			this.text(f["备注"]);

		return {

			recordId:
				record.record_id,

			orderNo:
				this.text(f["订单号"]),

			customerName:
				this.text(f["客户名称"]),

			trackingNumber,

			courier:
				this.text(f["物流公司"]),

			status:
				this.text(f["签收状态"]),

			shipmentDate:
				this.text(f["发货日期"]),

			lastUpdated:
				this.text(f["更新时间"]),

			awbCreatedTime:
				this.text(f["AWB创建时间"]),

			remarks,

			hasException:

				trackingNumber === ""

				||

				remarks.toLowerCase() === "no awb"

				||

				this.bool(f["是否异常"]),

			owner:
				this.person(f["负责人"]),

			channel:
				this.text(f["多选"])

		};

	}

}

export const shipmentFactory = new ShipmentFactory();
