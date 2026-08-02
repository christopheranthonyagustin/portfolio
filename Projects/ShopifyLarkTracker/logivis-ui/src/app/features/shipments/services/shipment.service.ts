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

  public getShipments(): Observable<Shipment[]> {
    return this.http.get<Shipment[]>(
      `${this.api}/shipments`
    );
  }

  bulkUpdate(): Observable<BulkUpdateResponse> {

    return this.http.put<BulkUpdateResponse>(
      `${environment.workerApi}/spx/bulk-update`,
      {}
    );

  }

  importShopifyOrders(): Observable<ImportShopifyResponse> {

    return this.http.post<ImportShopifyResponse>(
      `${environment.workerApi}/shopify/import`,
      {}
    );

  }

  getShipmentDetails(
    trackingNumber: string
  ): Observable<any> {

    return this.http.get(
      `${environment.workerApi}/spx/orders`,
      {
        params: {
          trackingNos: trackingNumber
        }
      }
    );

  }

  getShopifyOrder(
    orderNo: string
  ): Observable<ShopifyOrder> {

    return this.http.get<ShopifyOrder>(
      `${environment.workerApi}/shopify/orders`,
      {
        params: {
          orderIds: orderNo
        }
      }
    );

  }

}
