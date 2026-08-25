import {
  Component,
  ViewChild,
  ElementRef,
  ChangeDetectorRef
} from '@angular/core';

import { CommonModule } from '@angular/common';
import {
  DomSanitizer,
  SafeResourceUrl
} from '@angular/platform-browser';

import { environment } from '../../../../../environments/environment';

import { ShipmentService } from '../../services/shipment.service';
import { Shipment } from '../../../../models/shipment';

@Component({
  selector: 'app-shipment-multiple-awb-dialog',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './shipment-multiple-awb-dialog.component.html',
  styleUrls: ['./shipment-multiple-awb-dialog.component.scss']
})
export class ShipmentMultipleAwbDialogComponent {

  constructor(
    private readonly cdr: ChangeDetectorRef,
    private readonly shipmentService: ShipmentService,
    private readonly sanitizer: DomSanitizer
  ) { }

  @ViewChild('dialog')
  dialog!: ElementRef<HTMLDialogElement>;

  // ----------------------------------------------------------
  // Selected shipments
  // ----------------------------------------------------------

  shipments: Shipment[] = [];

  // ----------------------------------------------------------
  // AWB
  // ----------------------------------------------------------

  awbLink: string | null = null;

  safeAwbPreviewUrl:
    SafeResourceUrl | null = null;

  awbError: string | null = null;

  loading = false;

  // ----------------------------------------------------------
  // Open Multiple AWB
  // ----------------------------------------------------------

  openMultiple(shipments: Shipment[]): void {

    if (!shipments?.length) {
      return;
    }

    // ----------------------------------------------------------
    // Validate selection count
    // ----------------------------------------------------------

    if (shipments.length > 5) {
      alert(
        'You can select a maximum of 5 shipments for Multiple AWB.'
      );

      return;
    }

    // ----------------------------------------------------------
    // Validate ALL selected shipments
    // ----------------------------------------------------------

    const invalidShipments =
      shipments.filter(shipment => {

        const trackingNumber =
          shipment.trackingNumber?.trim() ?? '';

        const status =
          String(shipment.status ?? '')
            .trim()
            .toLowerCase();

        // No tracking number
        if (!trackingNumber) {
          return true;
        }

        // Must be SPX
        if (!trackingNumber.toUpperCase().startsWith('SPX')) {
          return true;
        }

        // Unfulfilled is not allowed
        if (status === 'unfulfilled') {
          return true;
        }

        return false;
      });

    // ----------------------------------------------------------
    // Block if ANY selected shipment is invalid
    // ----------------------------------------------------------

    if (invalidShipments.length > 0) {

      const invalidOrders =
        invalidShipments
          .map(
            shipment =>
              shipment.orderNo || '(Unknown Order)'
          )
          .join(', ');

      alert(
        `Multiple AWB is not available for the selected shipment(s).\n\n` +
        `Please remove these order(s): ${invalidOrders}`
      );

      return;
    }

    // ----------------------------------------------------------
    // All selected shipments are valid
    // ----------------------------------------------------------

    console.log(
      '[SPX] Opening Multiple AWB:',
      shipments
    );

    this.shipments =
      shipments;

    // ----------------------------------------------------------
    // Reset state
    // ----------------------------------------------------------

    this.loading = true;

    this.awbError = null;

    this.awbLink = null;

    this.safeAwbPreviewUrl = null;

    this.cdr.detectChanges();

    this.dialog.nativeElement.showModal();

    // ----------------------------------------------------------
    // Collect tracking numbers
    // ----------------------------------------------------------

    const trackingNumbers =
      shipments
        .map(
          shipment =>
            shipment.trackingNumber!.trim()
        );

    console.log(
      '[SPX] Batch AWB Tracking Numbers:',
      trackingNumbers
    );

    // ----------------------------------------------------------
    // ONE SPX batch request
    // ----------------------------------------------------------

    this.shipmentService
      .getAwbLabelBatch(trackingNumbers)
      .subscribe({

        next: async (response: any) => {

          console.log(
            '[SPX] Batch AWB Response:',
            response
          );

          const awbLink =
            response?.data?.awb_link;

          const failed =
            response?.data?.fail_list ?? [];

          if (failed.length > 0) {

            console.warn(
              '[SPX] Batch AWB Failed:',
              failed
            );

          }

          // ----------------------------------------------------
          // Validate SPX response
          // ----------------------------------------------------

          if (
            response?.ret_code !== 0 ||
            !awbLink
          ) {

            this.awbError =
              response?.message ||
              'AWB preview is not available for the selected shipments.';

            this.loading = false;

            this.cdr.detectChanges();

            return;
          }

          // ----------------------------------------------------
          // Consolidated AWB link
          // ----------------------------------------------------

          this.awbLink =
            awbLink;

          console.log(
            '[SPX] Batch AWB Link:',
            awbLink
          );

          const previewUrl =
            `${environment.workerApi}/spx/awb-preview?url=${encodeURIComponent(
              awbLink
            )}`;

          // ----------------------------------------------------
          // Verify preview endpoint
          // ----------------------------------------------------

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
                'AWB preview is not available for the selected shipments.';

              this.safeAwbPreviewUrl =
                null;

            }
            else {

              this.safeAwbPreviewUrl =
                this.sanitizer
                  .bypassSecurityTrustResourceUrl(
                    previewUrl
                  );

              this.awbError =
                null;

            }

          }
          catch {

            this.awbError =
              'Unable to load the AWB preview from SPX.';

            this.safeAwbPreviewUrl =
              null;

          }

          this.loading = false;

          this.cdr.detectChanges();

        },

        error: (err: any) => {

          console.error(
            '[SPX] Batch AWB Error:',
            err
          );

          this.awbError =
            'Unable to load the selected AWBs.';

          this.loading = false;

          this.cdr.detectChanges();

        }

      });

  }


  // ----------------------------------------------------------
  // Preview error
  // ----------------------------------------------------------

  onAwbPreviewError(): void {

    this.safeAwbPreviewUrl =
      null;

    this.awbError =
      'AWB preview is not available for the selected shipments.';

    this.cdr.detectChanges();

  }

  // ----------------------------------------------------------
  // Close
  // ----------------------------------------------------------

  close(): void {

    this.dialog.nativeElement.close();

    this.shipments = [];

    this.awbLink = null;

    this.safeAwbPreviewUrl = null;

    this.awbError = null;

    this.loading = false;

  }

}
