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
  DomSanitizer,
  SafeResourceUrl
} from '@angular/platform-browser';

import { environment } from '../../../../../environments/environment';

import { TrackOrder } from '../../../../core/models/track-order-response';

import { ShipmentService } from '../../services/shipment.service';

import { Shipment } from '../../../../models/shipment';

@Component({
  selector: 'app-shipment-awb-dialog',
  standalone: true,
  imports: [
    CommonModule,
    DatePipe,
    DecimalPipe,
    TranslatePipe
  ],
  templateUrl: './shipment-awb-dialog.component.html',
  styleUrls: ['./shipment-awb-dialog.component.scss']
})
export class ShipmentAwbDialogComponent {

  constructor(
    private readonly cdr: ChangeDetectorRef,
    private readonly shipmentService: ShipmentService,
    private readonly sanitizer: DomSanitizer
  ) { }


  @ViewChild('dialog')
  dialog!: ElementRef<HTMLDialogElement>;


  order: TrackOrder | null = null;

  orders: TrackOrder[] = [];

  orderFee: any = null;


  awbLink: string | null = null;

  safeAwbPreviewUrl: SafeResourceUrl | null = null;

  awbError: string | null = null;


  loading = false;


  open(order: TrackOrder | null): void {

    if (!order) {
      return;
    }


    this.order = order;

    this.orderFee = null;

    this.awbLink = null;

    this.safeAwbPreviewUrl = null;

    this.awbError = null;

    this.loading = true;


    this.cdr.detectChanges();

    this.dialog.nativeElement.showModal();


    // ==========================================================
    // GET ORDER FEE
    // ==========================================================

    this.shipmentService
      .getOrderFee(order.tracking_no)
      .subscribe({

        next: (response: any) => {

          console.log(
            '[SPX] Get Order Fee Response:',
            response
          );

          this.orderFee =
            response?.data?.orders?.[0] ?? null;

          this.loading = false;

          this.cdr.detectChanges();

        },

        error: (err: any) => {

          console.error(
            '[SPX] Get Order Fee Error:',
            err
          );

          this.loading = false;

          this.cdr.detectChanges();

        }

      });


    // ==========================================================
    // GET AWB LABEL
    // ==========================================================

    this.shipmentService
      .getAwbLabel(order.tracking_no)
      .subscribe({

        next: async (response: any) => {

          console.log(
            '[SPX] Get AWB Label Response:',
            response
          );


          // ------------------------------------------------------
          // Validate response
          // ------------------------------------------------------

          if (
            response?.ret_code !== 0 ||
            !response?.data?.awb_link
          ) {

            this.awbError =
              response?.message ||
              'AWB preview is not available for this shipment.';

            this.safeAwbPreviewUrl = null;

            this.cdr.detectChanges();

            return;

          }


          // ------------------------------------------------------
          // Store AWB link
          // ------------------------------------------------------

          const awbLink =
            response.data.awb_link as string;

          this.awbLink =
            awbLink;


          // ------------------------------------------------------
          // Build worker preview URL
          // ------------------------------------------------------

          const previewUrl =
            `${environment.workerApi}/spx/awb-preview?url=${encodeURIComponent(awbLink)}`;


          // ------------------------------------------------------
          // Verify worker endpoint
          // ------------------------------------------------------

          try {

            const check =
              await fetch(
                previewUrl,
                {
                  method: 'HEAD'
                }
              );


            if (!check.ok) {

              this.awbError =
                'AWB preview is not available for this shipment.';

              this.safeAwbPreviewUrl =
                null;

            } else {

              this.safeAwbPreviewUrl =
                this.sanitizer
                  .bypassSecurityTrustResourceUrl(
                    previewUrl
                  );

              this.awbError =
                null;

            }

          } catch {

            this.awbError =
              'Unable to load the AWB preview from SPX.';

            this.safeAwbPreviewUrl =
              null;

          }


          this.cdr.detectChanges();

        },

        error: (err: any) => {

          console.error(
            '[SPX] Get AWB Label Error:',
            err
          );

          this.awbError =
            'Unable to load the AWB preview from SPX.';

          this.safeAwbPreviewUrl =
            null;

          this.cdr.detectChanges();

        }

      });

  }


  // ==========================================================
  // CLOSE
  // ==========================================================

  close(): void {

    this.dialog.nativeElement.close();

  }


  // ==========================================================
  // STATUS CLASS
  // ==========================================================

  getStatusClass(
    status: string | null | undefined
  ): string {

    const value =
      (status ?? '')
        .trim()
        .toLowerCase();


    switch (value) {

      case 'delivered':
        return 'status-badge delivered';

      case 'in transit':
        return 'status-badge in-transit';

      case 'picked up':
        return 'status-badge picked-up';

      case 'pending':
        return 'status-badge pending';

      case 'cancelled':
        return 'status-badge cancelled';

      default:
        return 'status-badge';

    }

  }


  // ==========================================================
  // DOWNLOAD AWB
  // ==========================================================

  downloadAwb(): void {

    if (!this.awbLink) {
      return;
    }


    const proxyUrl =
      `${environment.workerApi}/spx/awb-preview?url=${encodeURIComponent(this.awbLink)}`;


    window.open(
      proxyUrl,
      '_blank'
    );

  }


  // ==========================================================
  // AWB PREVIEW ERROR
  // ==========================================================

  onAwbPreviewError(): void {

    this.safeAwbPreviewUrl =
      null;

    this.awbError =
      'AWB preview is not available for this shipment.';

    this.cdr.detectChanges();

  }

}
