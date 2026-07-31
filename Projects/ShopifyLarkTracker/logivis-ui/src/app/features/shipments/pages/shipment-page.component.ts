import {
  ChangeDetectorRef,
  Component,
  OnInit,
  inject
} from '@angular/core';

import { CommonModule } from '@angular/common';

import { AgGridAngular } from 'ag-grid-angular';

import type {
  ColDef,
  GridApi,
  GridReadyEvent
} from 'ag-grid-community';

import { Shipment } from '../../../models/shipment';
import { ShipmentService } from '../services/shipment.service';

@Component({
  selector: 'app-shipment-page',
  standalone: true,
  imports: [
    CommonModule,
    AgGridAngular
  ],
  templateUrl: './shipment-page.component.html',
  styleUrl: './shipment-page.component.scss'
})
export class ShipmentPageComponent implements OnInit {

  private readonly shipmentService =
    inject(ShipmentService);

  private readonly cdr =
    inject(ChangeDetectorRef);

  private gridApi?: GridApi;

  private requestStart = 0;

  shipments: Shipment[] = [];

  readonly defaultColDef: ColDef = {

    sortable: true,
    filter: true,
    resizable: true,
    flex: 1

  };

  readonly columnDefs: ColDef[] = [

    {
      field: 'orderNo',
      headerName: 'Order No'
    },

    {
      field: 'customerName',
      headerName: 'Customer'
    },

    {
      field: 'trackingNumber',
      headerName: 'Tracking No'
    },

    {
      field: 'shipmentDate',
      headerName: 'Shipment Date'
    },

    {
      field: 'status',
      headerName: 'Status'
    },

    {
      field: 'channel',
      headerName: 'Channel'
    }

  ];

  ngOnInit(): void {

    this.loadShipments();

  }

  onGridReady(
    event: GridReadyEvent
  ): void {

    this.gridApi = event.api;

    if (this.shipments.length > 0) {

      this.gridApi.setGridOption(
        'rowData',
        this.shipments
      );

    }

  }

  private loadShipments(): void {

    this.requestStart = performance.now();

    this.shipmentService
      .getShipments()
      .subscribe({

        next: (data: Shipment[]) => {

          console.log(
            `API Response: ${(performance.now() - this.requestStart).toFixed(0)} ms`
          );

          this.shipments = [...data];

          this.cdr.detectChanges();

          if (this.gridApi) {

            const renderStart = performance.now();

            this.gridApi.setGridOption(
              'rowData',
              this.shipments
            );

            requestAnimationFrame(() => {

              console.log(
                `Grid Render: ${(performance.now() - renderStart).toFixed(0)} ms`
              );

              console.log(
                `Total Load Time: ${(performance.now() - this.requestStart).toFixed(0)} ms`
              );

              console.log(
                `Rows Loaded: ${this.shipments.length}`
              );

            });

          }

        },

        error: err => {

          console.error(
            'Failed to load shipments.',
            err
          );

        }

      });

  }
}
