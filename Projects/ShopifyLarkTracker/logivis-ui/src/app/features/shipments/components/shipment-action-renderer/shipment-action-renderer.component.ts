import { Component } from '@angular/core';
import {
  ICellRendererAngularComp
} from 'ag-grid-angular';

@Component({
  selector: 'app-shipment-action-renderer',
  standalone: true,
  templateUrl: './shipment-action-renderer.component.html',
  styleUrls: ['./shipment-action-renderer.component.scss']
})
export class ShipmentActionRendererComponent
  implements ICellRendererAngularComp {

  params: any;

  agInit(params: any): void {

    this.params = params;

  }

  refresh(params: any): boolean {

    this.params = params;

    return true;

  }

  view(): void {

    this.params.onView(this.params.data);

  }

  history(): void {

    if (this.params.onHistory) {

      this.params.onHistory(this.params.data);

    }

  }

  estimate(): void {

    if (this.params.onEstimate) {

      this.params.onEstimate(this.params.data);

    }

  }

  awb(): void {

    if (this.params.onAwb) {

      this.params.onAwb(this.params.data);

    }

  }

  refreshShipment(): void {

    console.log(
      'Refresh',
      this.params.data
    );

  }

}
