import {
  AfterViewInit,
  ChangeDetectorRef,
  Component,
  ElementRef,
  ViewChild
} from '@angular/core';

import {
  CommonModule,
  DatePipe,
  DecimalPipe
} from '@angular/common';

import { TranslatePipe } from '@ngx-translate/core';

import { TrackOrder } from '../../../../core/models/track-order-response';

@Component({
  selector: 'app-shipment-history-dialog',
  standalone: true,
  imports: [
    CommonModule,
    DatePipe,
    DecimalPipe,
    TranslatePipe
  ],
  templateUrl: './shipment-history-dialog.component.html',
  styleUrls: ['./shipment-history-dialog.component.scss']
})
export class ShipmentHistoryDialogComponent
  implements AfterViewInit {

  constructor(
    private readonly cdr: ChangeDetectorRef
  ) { }

  @ViewChild('dialog', { static: false })
  dialog?: ElementRef<HTMLDialogElement>;

  order?: TrackOrder;

  ngAfterViewInit(): void {

    // console.log(
    //   '[History] ViewChild =',
    //   this.dialog
    // );

  }

  open(order: TrackOrder): void {

    console.log('[History] open()', order);

    this.order = order;

    this.cdr.detectChanges();

    if (!this.dialog) {

      console.error(
        '[History] Dialog ViewChild not found.'
      );

      return;

    }

    console.log(
      '[History] Native Dialog =',
      this.dialog.nativeElement
    );

    this.dialog.nativeElement.showModal();

  }

  close(): void {

    this.dialog?.nativeElement.close();

  }

}
