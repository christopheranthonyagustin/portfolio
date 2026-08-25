export interface ShipmentStatusStyle {
  label: string;
  background: string;
  color: string;
}

export const ShipmentStatusMap: Record<string, ShipmentStatusStyle> = {

  // ==========================================================
  // Shopify Fulfillment Status
  // ==========================================================

  "unfulfilled": {
    label: "Unfulfilled",
    background: "#FEF3C7",
    color: "#92400E"
  },

  "partial": {
    label: "Partial",
    background: "#FEF3C7",
    color: "#92400E"
  },

  "fulfilled": {
    label: "Fulfilled",
    background: "#DCFCE7",
    color: "#166534"
  },

  "restocked": {
    label: "Restocked",
    background: "#F3F4F6",
    color: "#4B5563"
  },

  // ==========================================================
  // SPX Status
  // ==========================================================

  "待揽收": {
    label: "Pending Pickup",
    background: "#FEF3C7",
    color: "#92400E"
  },

  "已揽收": {
    label: "Picked Up",
    background: "#DBEAFE",
    color: "#1E40AF"
  },

  "运输中": {
    label: "In Transit",
    background: "#E0F2FE",
    color: "#0369A1"
  },

  "派送中": {
    label: "Out for Delivery",
    background: "#EDE9FE",
    color: "#6D28D9"
  },

  "On Hold": {
    label: "On Hold",
    background: "#FEF3C7",
    color: "#92400E"
  },

  "Self Collect": {
    label: "Self Collect",
    background: "#E0E7FF",
    color: "#3730A3"
  },

  "已签收": {
    label: "Delivered",
    background: "#DCFCE7",
    color: "#166534"
  },

  "派送失败": {
    label: "Failed Delivery",
    background: "#FEE2E2",
    color: "#B91C1C"
  },

  "已退回": {
    label: "Returned",
    background: "#F3F4F6",
    color: "#374151"
  },

  "遗失": {
    label: "Lost",
    background: "#FECACA",
    color: "#991B1B"
  },

  "已取消": {
    label: "Canceled",
    background: "#E5E7EB",
    color: "#4B5563"
  },

  "异常": {
    label: "Exception",
    background: "#FEE2E2",
    color: "#991B1B"
  },

  "未知": {
    label: "Unknown",
    background: "#F3F4F6",
    color: "#6B7280"
  }

};

export function getShipmentStatus(
  status: string | null | undefined
): string {

  if (!status) {
    return "Unknown";
  }

  return ShipmentStatusMap[status]?.label ?? status;

}

export function getShipmentStatusStyle(
  status: string | null | undefined
): ShipmentStatusStyle {

  if (!status) {
    return ShipmentStatusMap["未知"];
  }

  return ShipmentStatusMap[status] ?? {
    label: status,
    background: "#F3F4F6",
    color: "#6B7280"
  };

}
