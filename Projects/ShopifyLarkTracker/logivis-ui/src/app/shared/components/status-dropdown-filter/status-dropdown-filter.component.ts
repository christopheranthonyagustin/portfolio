import { Component } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';
import {
  IFilterAngularComp
} from 'ag-grid-angular';

import {
  IFilterParams,
  IDoesFilterPassParams
} from 'ag-grid-community';

import { getShipmentStatus } from '../../../shared/utils/shipment-status.util';


@Component({
  selector: 'app-status-dropdown-filter',
  templateUrl: './status-dropdown-filter.component.html',
  styleUrls: ['./status-dropdown-filter.component.css']
})
export class StatusDropdownFilterComponent
  implements IFilterAngularComp {

  private params!: IFilterParams;

  selectedStatus = '';

  readonly statuses = [
    'Pending',
    'Unfulfilled',
    'Fulfilled',
    'Partial',
    'Pending Pickup',
    'Picked Up',
    'In Transit',
    'Out for Delivery',
    'On Hold',
    'Self Collect',
    'Delivered',
    'Failed Delivery',
    'Lost',
    'Exception',
    'Returned',
    'Canceled',
    'Restocked',
    'Unknown'
  ];

  constructor(
    private translate: TranslateService
  ) { }

  // ==========================================================
  // AG Grid initialization
  // ==========================================================

  agInit(params: IFilterParams): void {
    this.params = params;
  }

  // ==========================================================
  // Is filter active?
  // ==========================================================

  isFilterActive(): boolean {
    return this.selectedStatus !== '';
  }

  // ==========================================================
  // Filter rows
  // ==========================================================

  doesFilterPass(
    params: IDoesFilterPassParams
  ): boolean {

    if (!this.selectedStatus) {
      return true;
    }

    const status =
      getShipmentStatus(
        params.data?.status ?? 'Unknown'
      );

    return status === this.selectedStatus;
  }

  // ==========================================================
  // Get filter model
  // ==========================================================

  getModel(): any {

    if (!this.selectedStatus) {
      return null;
    }

    return {
      status: this.selectedStatus
    };
  }

  // ==========================================================
  // Restore filter model
  // ==========================================================

  setModel(model: any): void {

    this.selectedStatus =
      model?.status ?? '';
  }

  // ==========================================================
  // Dropdown changed
  // ==========================================================

  onStatusChanged(event: Event): void {

    const select =
      event.target as HTMLSelectElement;

    this.selectedStatus =
      select.value;

    this.params.filterChangedCallback();
  }

  // ==========================================================
  // Translation
  // ==========================================================

  getAllStatusesLabel(): string {
    return this.translate.instant(
      'dashboard.recentShipments.statusFilter.all'
    );
  }

  getStatusLabel(status: string): string {

    const key =
      this.getStatusTranslationKey(status);

    return this.translate.instant(
      `dashboard.charts.otherStatuses.statuses.${key}`
    );
  }

  // ==========================================================
  // Status translation key
  // ==========================================================

  private getStatusTranslationKey(
    status: string
  ): string {

    switch (status.toLowerCase()) {

      case 'pending':
        return 'pending';

      case 'unfulfilled':
        return 'unfulfilled';

      case 'fulfilled':
        return 'fulfilled';

      case 'partial':
        return 'partial';

      case 'pending pickup':
        return 'pendingPickup';

      case 'picked up':
        return 'pickedUp';

      case 'in transit':
        return 'inTransit';

      case 'out for delivery':
        return 'outForDelivery';

      case 'on hold':
        return 'onHold';

      case 'self collect':
        return 'selfCollect';

      case 'delivered':
        return 'delivered';

      case 'failed delivery':
        return 'failedDelivery';

      case 'lost':
        return 'lost';

      case 'exception':
        return 'exception';

      case 'returned':
        return 'returned';

      case 'canceled':
        return 'canceled';

      case 'restocked':
        return 'restocked';

      default:
        return 'unknown';
    }
  }
}
