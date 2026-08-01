import {
  Component,
  ViewChild,
  ElementRef,
  ChangeDetectorRef
} from '@angular/core';

import { TrackOrder } from '../../../../core/models/track-order-response';
import { CommonModule, DatePipe, DecimalPipe } from '@angular/common';

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
  order!: TrackOrder;

  open(order: TrackOrder): void {
    console.log('dialog open =', this.dialog.nativeElement.open);
    console.log('order =', this.order);
    console.log('[DIALOG] open()', order);

    this.order = order;

    this.cdr.detectChanges();

    this.dialog.nativeElement.showModal();

    console.log('[OPEN]', this.dialog.nativeElement.open);

  }

  close(): void {

    this.dialog.nativeElement.close();

  }

}
