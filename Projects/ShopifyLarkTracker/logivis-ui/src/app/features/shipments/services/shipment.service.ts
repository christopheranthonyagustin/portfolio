import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

import { Shipment } from '../../../models/shipment';
import { environment } from '../../../../environments/environment';
import { BulkUpdateResponse } from '../../../core/models/BulkUpdateResponse';
import { ImportShopifyResponse } from '../../../core/models/ImportShopifyResponse';
import { ShopifyOrder } from '../../../core/models/shopify/ShopifyOrder';

@Injectable({
  providedIn: 'root'
})
export class ShipmentService {

  private readonly http = inject(HttpClient);
  private readonly api = environment.workerApi;


  // ==========================================================
  // Shipments
  // ==========================================================

  public getShipments(): Observable<Shipment[]> {

    return this.http.get<Shipment[]>(
      `${this.api}/shipments`
    );

  }


  // ==========================================================
  // Shopify
  // ==========================================================

  importShopifyOrders(): Observable<ImportShopifyResponse> {

    return this.http.post<ImportShopifyResponse>(
      `${this.api}/shopify/import`,
      {}
    );

  }

  getShopifyOrder(
    orderNo: string
  ): Observable<ShopifyOrder> {

    return this.http.get<ShopifyOrder>(
      `${this.api}/shopify/orders`,
      {
        params: {
          orderIds: orderNo
        }
      }
    );

  }


  // ==========================================================
  // Shipment / SPX
  // ==========================================================

  bulkUpdate(): Observable<BulkUpdateResponse> {

    return this.http.put<BulkUpdateResponse>(
      `${this.api}/spx/bulk-update`,
      {}
    );

  }

  getShipmentDetails(
    trackingNumber: string
  ): Observable<any> {

    return this.http.get(
      `${this.api}/spx/orders`,
      {
        params: {
          trackingNos: trackingNumber
        }
      }
    );

  }

  getShipmentDetailsByOrderId(
    orderId: string
  ): Observable<any> {

    return this.http.get(
      `${this.api}/spx/orders`,
      {
        params: {
          orderIds: orderId
        }
      }
    );

  }

  getOrderFee(
    trackingNumber: string
  ): Observable<any> {

    return this.http.get(
      `${this.api}/spx/order-fee`,
      {
        params: {
          trackingNos: trackingNumber
        }
      }
    );

  }

  getShippingFee(
    request: {
      senderPostCode: string;
      deliverPostCode: string;
      parcelWeight: number;
      parcelLength?: number;
      parcelWidth?: number;
      parcelHeight?: number;
    }
  ): Observable<any> {

    return this.http.post(
      `${this.api}/spx/shipping-fee`,
      request
    );

  }


  // ==========================================================
  // AWB
  // ==========================================================

  getAwbLabel(
    trackingNumber: string
  ): Observable<any> {

    return this.http.get(
      `${this.api}/spx/awb`,
      {
        params: {
          trackingNos: trackingNumber
        }
      }
    );

  }

  getAwbLabelBatch(
    trackingNumbers: string[]
  ): Observable<any> {

    return this.http.post<any>(
      `${this.api}/spx/get-awb-label`,
      {
        tracking_no_list: trackingNumbers
      }
    );

  }


  // ==========================================================
  // Quick Create SPX
  // ==========================================================

  getPickupTime(): Observable<any> {

    return this.http.post<any>(
      `${this.api}/spx/pickup-time`,
      {
        service_type: 1
      }
    );

  }

  createSpxOrders(
    request: any
  ): Observable<any> {

    return this.http.post<any>(
      `${this.api}/spx/create-order`,
      request
    );

  }

  cancelSpxOrders(
    request: any
  ): Observable<any> {

    return this.http.post<any>(
      `${this.api}/spx/cancel-order`,
      request
    );

  }

}
