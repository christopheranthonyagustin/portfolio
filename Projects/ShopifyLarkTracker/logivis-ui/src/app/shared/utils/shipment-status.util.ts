export const ShipmentStatusMap: Record<string, string> = {

  "待揽收": "Pending Pickup",
  "已揽收": "Picked Up",
  "运输中": "In Transit",
  "派送中": "Out for Delivery",
  "已签收": "Delivered",
  "派送失败": "Failed Delivery",
  "已退回": "Returned",
  "遗失": "Lost",
  "已取消": "Canceled",
  "异常": "Exception",
  "未知": "Unknown"

};

export function getShipmentStatus(status: string | null | undefined): string {

  if (!status) {
    return "Unknown";
  }

  return ShipmentStatusMap[status] ?? status;

}
