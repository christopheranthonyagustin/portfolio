import {
  Component,
  ViewChild,
  ElementRef,
  ChangeDetectorRef
} from '@angular/core';

import {
  CommonModule,
  DatePipe,
  DecimalPipe
} from '@angular/common';

import {
  TranslatePipe
} from '@ngx-translate/core';

import {
  TrackOrder
} from '../../../../core/models/track-order-response';

import {
  ShopifyOrder
} from '../../../../core/models/shopify/ShopifyOrder';

import {
  ShipmentService
} from '../../services/shipment.service';


@Component({
  selector: 'app-shipment-est-dialog',
  standalone: true,
  imports: [
    CommonModule,
    DatePipe,
    DecimalPipe,
    TranslatePipe
  ],
  templateUrl: './shipment-est-dialog.component.html',
  styleUrls: ['./shipment-est-dialog.component.scss']
})
export class ShipmentEstDialogComponent {

  constructor(
    private readonly cdr: ChangeDetectorRef,
    private readonly shipmentService: ShipmentService
  ) { }


  // ==========================================================
  // DIALOG
  // ==========================================================

  @ViewChild('dialog')
  dialog!: ElementRef<HTMLDialogElement>;


  // ==========================================================
  // DATA
  // ==========================================================

  order: TrackOrder | null = null;

  shopifyOrder: ShopifyOrder | null = null;

  /**
   * Contains the first order returned by the SPX
   * Check Shipping Fee API.
   */
  shippingFee: any = null;


  // ==========================================================
  // UI STATE
  // ==========================================================

  loading = false;

  shippingFeeError: string | null = null;


  // ==========================================================
  // TEMPORARY SHIPPING ESTIMATION
  // ==========================================================

  /**
   * Temporary shipping weight.
   *
   * This will later be replaced by the actual
   * product / packing weight calculation.
   */
  readonly estimatedWeight = 15;


  /**
   * Actual quantity from Shopify.
   */
  totalQuantity = 0;


  // ==========================================================
  // OPEN
  // ==========================================================

  open(
    order: TrackOrder | null,
    shopifyOrder: ShopifyOrder | null
  ): void {

    console.log(
      '[ESTIMATE] Shopify Order:',
      shopifyOrder
    );

    console.log(
      '[ESTIMATE] Existing SPX Order:',
      order
    );


    // --------------------------------------------------------
    // Shopify order is required
    // --------------------------------------------------------

    if (!shopifyOrder) {

      console.warn(
        '[ESTIMATE] Shopify order is required.'
      );

      return;
    }


    // --------------------------------------------------------
    // ESTIMATION PROTECTION
    //
    // If an SPX shipment already exists, do not estimate it.
    // --------------------------------------------------------

    if (order && !this.canEstimate(order)) {

      alert(
        'This shipment has already been created and cannot be estimated again.'
      );

      console.log(
        '[ESTIMATE] Existing SPX shipment. Estimation blocked.',
        {
          trackingNo: order.tracking_no,
          status: order.status
        }
      );

      return;
    }


    // --------------------------------------------------------
    // RECEIVER POSTCODE
    // --------------------------------------------------------

    const deliverPostCode =
      shopifyOrder.shippingAddress?.zip?.trim() ?? '';


    // --------------------------------------------------------
    // DELIVERY METHOD
    // --------------------------------------------------------

    const deliveryMethod =
      (shopifyOrder.deliveryMethod ?? '')
        .trim()
        .toLowerCase();


    // --------------------------------------------------------
    // ROADSHOW PROTECTION
    //
    // RoadShow orders may not have a receiver postcode.
    // Do not open the estimation dialog and do not call SPX.
    // --------------------------------------------------------

    const isRoadShow =
      deliveryMethod.includes('roadshow');


    if (
      isRoadShow &&
      !deliverPostCode
    ) {

      alert(
        'Shipping fee estimation is not available for this RoadShow order because the receiver postcode is not available.'
      );

      console.warn(
        '[ESTIMATE] RoadShow order has no receiver postcode. Estimation blocked.',
        {
          orderNo:
            shopifyOrder.orderNumber,

          deliveryMethod:
            shopifyOrder.deliveryMethod,

          deliverPostCode
        }
      );

      return;
    }


    // --------------------------------------------------------
    // Store current data
    // --------------------------------------------------------

    this.order =
      order;

    this.shopifyOrder =
      shopifyOrder;


    // --------------------------------------------------------
    // Calculate Shopify quantity
    // --------------------------------------------------------

    this.totalQuantity =
      this.getTotalQuantity();


    // --------------------------------------------------------
    // Reset previous estimate
    // --------------------------------------------------------

    this.shippingFee =
      null;

    this.shippingFeeError =
      null;


    // --------------------------------------------------------
    // Start loading
    // --------------------------------------------------------

    this.loading =
      true;


    this.cdr.detectChanges();


    // --------------------------------------------------------
    // Open dialog
    // --------------------------------------------------------

    this.dialog.nativeElement.showModal();


    console.log(
      '[ESTIMATE] Dialog opened.'
    );


    // ========================================================
    // TEMPORARY WEIGHT
    // ========================================================

    const parcelWeight =
      this.estimatedWeight;


    // ========================================================
    // SENDER POSTCODE
    // ========================================================

    const senderPostCode =
      this.getStoreSenderPostCode();


    // ========================================================
    // LOG REQUEST
    // ========================================================

    console.log(
      '[SPX] Check Shipping Fee Request:',
      {
        senderPostCode,
        deliverPostCode,
        parcelWeight,
        quantity:
          this.totalQuantity,
        orderNo:
          shopifyOrder.orderNumber,
        sourceName:
          shopifyOrder.sourceName,
        deliveryMethod:
          shopifyOrder.deliveryMethod
      }
    );


    // ========================================================
    // VALIDATION
    // ========================================================

    if (!senderPostCode) {

      this.shippingFeeError =
        'Sender postcode is not available for shipping fee estimation.';

      this.loading =
        false;

      this.cdr.detectChanges();

      return;
    }


    // --------------------------------------------------------
    // General receiver postcode validation
    // --------------------------------------------------------

    if (!deliverPostCode) {

      this.shippingFeeError =
        'Receiver postcode is not available from the Shopify order.';

      this.loading =
        false;

      this.cdr.detectChanges();

      return;
    }


    // --------------------------------------------------------
    // Quantity validation
    // --------------------------------------------------------

    if (this.totalQuantity <= 0) {

      this.shippingFeeError =
        'Order quantity is not available from Shopify.';

      this.loading =
        false;

      this.cdr.detectChanges();

      return;
    }


    // --------------------------------------------------------
    // Weight validation
    // --------------------------------------------------------

    if (parcelWeight <= 0) {

      this.shippingFeeError =
        'Estimated parcel weight must be greater than zero.';

      this.loading =
        false;

      this.cdr.detectChanges();

      return;
    }


    // ========================================================
    // CALL SPX CHECK SHIPPING FEE API
    // ========================================================

    this.shipmentService
      .getShippingFee({

        senderPostCode,

        deliverPostCode,

        parcelWeight

      })
      .subscribe({

        // ====================================================
        // SUCCESS
        // ====================================================

        next: (response: any) => {

          console.log(
            '[SPX] Check Shipping Fee Response:',
            response
          );


          // --------------------------------------------------
          // Validate SPX response
          // --------------------------------------------------

          if (
            !response ||
            response.ret_code !== 0
          ) {

            this.shippingFee =
              null;

            this.shippingFeeError =
              response?.message ||
              'Unable to estimate shipping fee.';

            this.loading =
              false;

            this.cdr.detectChanges();

            return;
          }


          // --------------------------------------------------
          // Get first returned order
          // --------------------------------------------------

          const estimatedOrder =
            response?.data?.orders?.[0] ?? null;


          // --------------------------------------------------
          // No estimate returned
          // --------------------------------------------------

          if (!estimatedOrder) {

            this.shippingFee =
              null;

            this.shippingFeeError =
              'No shipping fee estimate was returned by SPX.';

            this.loading =
              false;

            this.cdr.detectChanges();

            return;
          }


          // --------------------------------------------------
          // Store SPX estimate
          // --------------------------------------------------

          this.shippingFee =
            estimatedOrder;


          console.log(
            '[SPX] Estimated Shipping Fee:',
            this.shippingFee.estimated_shipping_fee
          );


          // --------------------------------------------------
          // Complete loading
          // --------------------------------------------------

          this.loading =
            false;

          this.shippingFeeError =
            null;

          this.cdr.detectChanges();

        },


        // ====================================================
        // ERROR
        // ====================================================

        error: (err: any) => {

          console.error(
            '[SPX] Check Shipping Fee Error:',
            err
          );


          this.shippingFee =
            null;

          this.shippingFeeError =
            err?.error?.message ||
            err?.message ||
            'Unable to estimate shipping fee.';

          this.loading =
            false;

          this.cdr.detectChanges();

        }

      });

  }


  // ==========================================================
  // STORE INFORMATION
  // ==========================================================

  /**
   * TEMPORARY:
   *
   * W Network Private Limited
   * 35 TAMPINES STREET 92
   * #03-01
   * Singapore 528880
   *
   * This will later be replaced by Store Information.
   */
  private getStoreSenderPostCode(): string {

    return '528880';

  }


  // ==========================================================
  // CLOSE
  // ==========================================================

  close(): void {

    if (
      this.dialog?.nativeElement
    ) {

      this.dialog.nativeElement.close();

    }

    this.loading =
      false;

  }


  // ==========================================================
  // PRODUCT QUANTITY
  // ==========================================================

  getProductQuantity(
    productName: string
  ): number {

    if (!this.shopifyOrder) {
      return 1;
    }


    const normalizedProductName =
      productName
        .trim()
        .toLowerCase();


    const product =
      this.shopifyOrder.lineItems.find(item => {

        const title =
          (item.title ?? '')
            .trim()
            .toLowerCase();

        return (
          normalizedProductName.includes(title) ||
          title.includes(normalizedProductName)
        );

      });


    return Number(
      product?.quantity ?? 1
    );

  }


  // ==========================================================
  // TOTAL QUANTITY
  // ==========================================================

  getTotalQuantity(): number {

    if (!this.shopifyOrder) {
      return 0;
    }


    return this.shopifyOrder.lineItems
      .reduce(
        (
          sum,
          item
        ) => {

          return (
            sum +
            Number(item.quantity ?? 0)
          );

        },
        0
      );

  }


  // ==========================================================
  // FUTURE WEIGHT CALCULATION
  // ==========================================================

  /**
   * Future implementation:
   *
   * Shopify product weight
   * +
   * quantity
   * +
   * packing / product matrix
   *
   * Current SPX estimate intentionally uses
   * the hard-coded 15 kg value above.
   */
  getEstimatedWeight(): number {

    if (!this.shopifyOrder) {
      return 0;
    }


    return this.shopifyOrder.lineItems
      .reduce(
        (
          total,
          item
        ) => {

          const weight =
            Number(item.weight ?? 0);

          const quantity =
            Number(item.quantity ?? 0);

          const unit =
            (item.weightUnit ?? '')
              .toUpperCase();


          let weightKg =
            weight;


          if (
            unit === 'GRAMS' ||
            unit === 'G'
          ) {

            weightKg =
              weight / 1000;

          }


          if (
            unit === 'POUNDS' ||
            unit === 'LB'
          ) {

            weightKg =
              weight * 0.453592;

          }


          return (
            total +
            (weightKg * quantity)
          );

        },
        0
      );

  }


  // ==========================================================
  // ESTIMATION PROTECTION
  // ==========================================================

  canEstimate(
    order: TrackOrder
  ): boolean {

    const trackingNo =
      (order.tracking_no ?? '')
        .trim();


    /*
     * If an SPX delivery order already exists,
     * don't estimate it again.
     */
    if (trackingNo) {

      return false;

    }


    return true;

  }

}
