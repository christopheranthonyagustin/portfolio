using ShopifyLarkTracker.Models;

namespace ShopifyLarkTracker.Services;

public class ExceptionEngine
{
    public void Evaluate(Shipment shipment)
    {
        shipment.IsException = false;
        shipment.Remarks = "OK";

        if (!shipment.HasTracking)
        {
            shipment.IsException = true;
            shipment.Remarks = "No AWB";
            return;
        }

        if (string.IsNullOrWhiteSpace(shipment.Status))
        {
            shipment.Remarks = "Tracking Available";
            return;
        }

        shipment.Remarks = shipment.Status;
    }
}