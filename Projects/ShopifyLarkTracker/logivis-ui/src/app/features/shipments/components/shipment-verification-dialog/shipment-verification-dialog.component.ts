import {
  Component,
  ViewChild,
  ElementRef,
  ChangeDetectorRef
} from '@angular/core';

import { TrackOrder } from '../../../../core/models/track-order-response';
import { CommonModule, DatePipe, DecimalPipe } from '@angular/common';
import { ShopifyOrder } from '../../../../core/models/shopify/ShopifyOrder';

@Component({
  selector: 'app-shipment-verification-dialog',
  standalone: true,
  imports: [
    CommonModule,
    DatePipe,
    DecimalPipe
  ],
  templateUrl: './shipment-verification-dialog.component.html',
  styleUrls: ['./shipment-verification-dialog.component.scss']
})
export class ShipmentVerificationDialogComponent {

  constructor(
    private readonly cdr: ChangeDetectorRef
  ) {
  }

  @ViewChild('dialog')
  dialog!: ElementRef<HTMLDialogElement>;
  order: TrackOrder | null = null;
  shopifyOrder: ShopifyOrder | null = null;

  open(
    order: TrackOrder | null,
    shopifyOrder: ShopifyOrder | null
      ): void {
  
    console.log('[SPX DIALOG] open()', order);
    console.log('[SHOPIFY DIALOG] open()', shopifyOrder);
    this.order = order;
    this.shopifyOrder = shopifyOrder;
    this.cdr.detectChanges();
    this.dialog.nativeElement.showModal();


  }

  close(): void {

    this.dialog.nativeElement.close();

  }

  getProductQuantity(productName: string): number {

    if (!this.shopifyOrder) {
      return 1;
    }

    const product = this.shopifyOrder.lineItems.find(item =>
      productName
        .toLowerCase()
        .includes(item.title.toLowerCase()) ||
      item.title
        .toLowerCase()
        .includes(productName.toLowerCase())
    );

    return product?.quantity ?? 1;

  }

  getTotalQuantity(): number {

    if (!this.shopifyOrder) {
      return 0;
    }

    return this.shopifyOrder.lineItems
      .reduce((sum, item) => sum + item.quantity, 0);

  }

  getEstimatedWeight(): number {

    if (!this.shopifyOrder) {
      return 0;
    }

    return this.shopifyOrder.lineItems
      .reduce((sum, item) => sum + (item.grams * item.quantity), 0) / 1000;

  }

  public formatOrderCreated(
    value: Date | string | null | undefined
  ): string {

    if (!value) {
      return '-';
    }

    const date =
      value instanceof Date
        ? value
        : new Date(value);

    if (isNaN(date.getTime())) {
      return '-';
    }

    const day =
      String(date.getDate()).padStart(2, '0');

    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];

    const month =
      months[date.getMonth()];

    const year =
      date.getFullYear();

    let hours =
      date.getHours();

    const minutes =
      String(date.getMinutes()).padStart(2, '0');

    const amPm =
      hours >= 12
        ? 'PM'
        : 'AM';

    hours =
      hours % 12 || 12;

    return `${day}-${month}-${year} ${hours}:${minutes} ${amPm}`;
  }

}
