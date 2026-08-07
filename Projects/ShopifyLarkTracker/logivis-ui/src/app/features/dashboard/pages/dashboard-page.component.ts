import {
  ChangeDetectorRef,
  Component,
  DestroyRef,
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

import { SidebarComponent } from '../../../layout/sidebar/sidebar.component';
import { HeaderComponent } from '../../../layout/header/header.component';
import { FooterComponent } from '../../../layout/footer/footer.component';

import { AuthService } from '../../auth/services/auth.service';
import { ShipmentService } from '../../shipments/services/shipment.service';

import { User } from '../../../core/models/User';
import { Shipment } from '../../../models/shipment';

import { BaseChartDirective } from 'ng2-charts';
import { ChartConfiguration } from 'chart.js';

import { themeQuartz } from 'ag-grid-community';
import { finalize } from 'rxjs/operators';

import { getShipmentStatus } from '../../../shared/utils/shipment-status.util';

import { FormsModule } from '@angular/forms';
import { SidebarService } from '../../../layout/sidebar/sidebar.service';
import { dateTimeFormatter } from '../../../shared/utils/date-utils';
import { CellClassParams, CellStyle} from 'ag-grid-community';
import { ShipmentActionRendererComponent } from '../../../features/shipments/components/shipment-action-renderer/shipment-action-renderer.component';
import { ShipmentVerificationDialogComponent } from '../../../features/shipments/components/shipment-verification-dialog/shipment-verification-dialog.component';
import { TrackOrderResponse } from '../../../core/models/track-order-response';
import { ViewChild } from '@angular/core';
import { ShipmentHistoryDialogComponent } from '../../../features/shipments/components/shipment-history-dialog/shipment-history-dialog.component';
import { forkJoin } from 'rxjs';
import { Companies } from '../../../core/models/Companies';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../environments/environment';


@Component({
  selector: 'app-dashboard-page',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    AgGridAngular,
    BaseChartDirective,
    SidebarComponent,
    HeaderComponent,
    FooterComponent,
    ShipmentActionRendererComponent,
    ShipmentVerificationDialogComponent,
    ShipmentHistoryDialogComponent
  ],
  templateUrl: './dashboard-page.component.html',
  styleUrls: ['./dashboard-page.component.scss']
})

export class DashboardPageComponent implements OnInit {

  components = {
    shipmentActionRenderer: ShipmentActionRendererComponent
  };

  @ViewChild(ShipmentVerificationDialogComponent)
  private shipmentDialog!: ShipmentVerificationDialogComponent;

  @ViewChild(ShipmentHistoryDialogComponent)
  private shipmentHistoryDialog!: ShipmentHistoryDialogComponent;

  constructor(
    public readonly sidebarService: SidebarService
  ) { }

  private readonly destroyRef =
    inject(DestroyRef);

  private readonly cdr =
    inject(ChangeDetectorRef);

  private readonly authService =
    inject(AuthService);

  private readonly shipmentService =
    inject(ShipmentService);

  private dashboardGridApi?: GridApi;
  theme = themeQuartz;
  showNotification = false;
  isBulkUpdating = false;
  isImportingShopify = false;
  notificationTitle = '';
  notificationMessage = '';
  selectedCompany = 'all';
  selectedDateRange = 'last30';
  allShipments: Shipment[] = [];
  filteredShipments: Shipment[] = [];
  masterOrderNo: string = '';
  activeCompanyId = 0;
  parentCompanyId = 0;
  companyOptions: Companies[] = [];
  private readonly ALL_COMPANIES_ID = 0;
  private readonly http = inject(HttpClient);
  parentCompanies: Companies[] = [];

  readonly defaultColDef: ColDef = {

    sortable: true,
    filter: true,
    floatingFilter: true,
    resizable: true
    

  };


  readonly dashboardColumnDefs: ColDef[] = [

    {
      field: 'orderNo',
      headerName: 'Order No',
      pinned: 'left',
      width: 120
    },

    {
      field: 'trackingNumber',
      headerName: 'Tracking No',
      minWidth: 120
    },

    {
      field: 'customerName',
      headerName: 'Customer',
      minWidth: 220
    },

    {
      field: 'courier',
      headerName: 'Courier',
      width: 120
    },

    {
      field: 'status',
      headerName: 'Status',
      width: 170,

      valueFormatter: params => getShipmentStatus(params.value),

      cellStyle: (params: CellClassParams): CellStyle | null => {

        const status = getShipmentStatus(params.value);

        switch (status) {

          case 'Pending Pickup':
            return {
              backgroundColor: '#FEF3C7',
              color: '#92400E',
              fontWeight: '600'
            };

          case 'Picked Up':
            return {
              backgroundColor: '#DBEAFE',
              color: '#1E40AF',
              fontWeight: '600'
            };

          case 'In Transit':
            return {
              backgroundColor: '#E0F2FE',
              color: '#0369A1',
              fontWeight: '600'
            };

          case 'Out for Delivery':
            return {
              backgroundColor: '#EDE9FE',
              color: '#6D28D9',
              fontWeight: '600'
            };

          case 'Delivered':
            return {
              backgroundColor: '#DCFCE7',
              color: '#166534',
              fontWeight: '600'
            };

          case 'Failed Delivery':
          case 'Lost':
          case 'Exception':
            return {
              backgroundColor: '#FEE2E2',
              color: '#991B1B',
              fontWeight: '600'
            };

          case 'Returned':
          case 'Canceled':
            return {
              backgroundColor: '#F3F4F6',
              color: '#4B5563',
              fontWeight: '600'
            };

          default:
            return null;

        }

      }

    },

    {
      field: 'channel',
      headerName: 'Channel',
      width: 120
    },

    {
      field: 'awbCreatedTime',
      headerName: 'AWB Created',
      minWidth: 170,
      valueFormatter: params => dateTimeFormatter(params.value),
      filter: 'agDateColumnFilter',
      filterParams: {
        includeTime: false
      }
    },

    {
      field: 'shipmentDate',
      headerName: 'Shipment Date',
      minWidth: 170,
      valueFormatter: params => dateTimeFormatter(params.value),
      filter: 'agDateColumnFilter',
      filterParams: {
        includeTime: false
      }
    },

    {
      field: 'lastUpdated',
      headerName: 'Last Updated',
      minWidth: 170,
      valueFormatter: params => dateTimeFormatter(params.value),
      filter: 'agDateColumnFilter',
      filterParams: {
        includeTime: false
      }
    },

    {
      field: 'remarks',
      headerName: 'Remarks',
      minWidth: 220
    },

    {
      field: 'hasException',
      headerName: 'Exception',
      width: 110,
      valueFormatter: params => params.value ? '⚠ Yes' : ''
    },

    {
      headerName: 'Actions',
      sortable: false,
      filter: false,
      width: 180,
      pinned: 'right',
      cellRenderer: ShipmentActionRendererComponent,
      cellRendererParams: {
        onView: (shipment: Shipment) => this.viewShipment(shipment),
        onHistory: (shipment: Shipment) => this.historyShipment(shipment)
      }
    }

  ];

  private readonly statusOrder = [
    'Pending Pickup',
    'In Transit',
    'Out for Delivery',
    'Delivered',
    'Returned',
    'Lost',
    'Canceled',
    'Unknown'
  ];

  // ------------------------------------------------------------------
  // Channel Doughnut Chart
  // ------------------------------------------------------------------

  public channelChartType: 'doughnut' = 'doughnut';

  public channelChartData:
    ChartConfiguration<'doughnut'>['data'] = {

      labels: [],

      datasets: [

        {
          data: []
        }

      ]

    };

  public channelChartOptions:
    ChartConfiguration<'doughnut'>['options'] = {

      responsive: true,

      maintainAspectRatio: false,

      cutout: '65%',

      plugins: {

        legend: {

          position: 'bottom',
          onClick: () => {
            // Disable legend click
          },
          labels: {

            usePointStyle: true,
            pointStyle: 'circle',
            padding: 20

          }

        },

        tooltip: {

          callbacks: {

            label: (context) =>
              `${context.label}: ${context.parsed} shipments`

          }

        }

      }

    };

  // ------------------------------------------------------------------
  // Status Chart
  // ------------------------------------------------------------------

  public statusChartData:
    ChartConfiguration<'bar'>['data'] = {

      labels: [],

      datasets: [

        {
          data: []
        }

      ]

    };

  public statusChartOptions:
    ChartConfiguration<'bar'>['options'] = {

      responsive: true,

      maintainAspectRatio: false,

      indexAxis: 'y',

      plugins: {

        legend: {

          display: false

        }

      },

      scales: {

        x: {

          beginAtZero: true

        }

      }

    };

  // ------------------------------------------------------------------
  // Shipment Trend
  // ------------------------------------------------------------------

  public trendChartData:
    ChartConfiguration<'line'>['data'] = {

      labels: [],

      datasets: [

        {

          label: 'Shipments',

          data: [],

          borderColor: '#2563eb',

          backgroundColor: '#93c5fd',

          tension: 0.3,

          fill: false

        }

      ]

    };

  public trendChartOptions:
    ChartConfiguration<'line'>['options'] = {

      responsive: true,

      maintainAspectRatio: false,

      plugins: {

        legend: {

          display: false

        }

      },

      scales: {

        y: {

          beginAtZero: true,

          ticks: {

            precision: 0

          }

        }

      }

    };

  public pendingPickup = 0;

  public inTransit = 0;

  public delivered = 0;

  public exceptions = 0;

  private filterByDateRange(
    shipments: Shipment[]
  ): Shipment[] {

    if (this.selectedDateRange === 'all') {
      return shipments;
    }

    const today = new Date();
    today.setHours(0, 0, 0, 0);

    const start = new Date(today);
    const end = new Date(today);

    switch (this.selectedDateRange) {

      case 'today':
        end.setDate(end.getDate() + 1);
        break;

      case 'yesterday':
        start.setDate(start.getDate() - 1);
        end.setDate(end.getDate() - 1);
        end.setDate(end.getDate() + 1);
        break;

      case 'last7':
        start.setDate(start.getDate() - 6);
        end.setDate(end.getDate() + 1);
        break;

      case 'last30':
        start.setDate(start.getDate() - 29);
        end.setDate(end.getDate() + 1);
        break;

      case 'thisMonth':
        start.setDate(1);
        end.setMonth(end.getMonth() + 1, 1);
        break;

      case 'lastMonth':
        start.setMonth(start.getMonth() - 1, 1);
        end.setDate(1);
        break;

      default:
        return shipments;

    }

    start.setHours(0, 0, 0, 0);
    end.setHours(0, 0, 0, 0);

    return shipments.filter(shipment => {

      if (!shipment.shipmentDate) {
        return false;
      }

      const shipmentDate = new Date(shipment.shipmentDate);
      shipmentDate.setHours(0, 0, 0, 0);

      return shipmentDate >= start &&
        shipmentDate < end;

    });

  }
  get currentUser(): User | null {

    return this.authService.getCurrentUser();

  }

  get companies() {

    return this.currentUser?.Companies ?? [];

  }

  get isSuperUser(): boolean {

    const user = this.currentUser;

    return !!user &&
      (user.IsSuperUser || user.UserId === 1);

  }

  get hasPermissions(): boolean {

    const user = this.currentUser;

    if (!user) {

      return false;

    }

    if (this.isSuperUser) {

      return true;

    }

    return !!user.Permissions &&
      user.Permissions.length > 0;

  }

  ngOnInit(): void {

    if (!this.currentUser) {
      return;
    }

    // Default parent company comes from the logged-in user
    this.parentCompanyId = this.currentUser.CompanyId;

    this.companyOptions = [
      {
        CompanyId: this.ALL_COMPANIES_ID,
        Name: '---'
      },
      ...this.companies
    ];

    if (this.isSuperUser) {

      // Load all parent companies
      this.loadParentCompanies();

      // Default selected company = Super User's company
      this.activeCompanyId = this.currentUser.CompanyId;

    }
    else {

      // Tenant users
      this.activeCompanyId = this.ALL_COMPANIES_ID;

    }

    this.loadRecentShipments();

    const notification = history.state?.notification;

    if (!notification) {
      return;
    }

    this.notificationTitle = notification.title;
    this.notificationMessage = notification.message;
    this.showNotification = true;

    const timer = window.setTimeout(() => {
      this.showNotification = false;
      this.cdr.detectChanges();
    }, 3000);

    this.destroyRef.onDestroy(() => clearTimeout(timer));

  }

  onGridReady(
    event: GridReadyEvent
  ): void {

    this.dashboardGridApi = event.api;

    if (this.allShipments.length > 0) {

      this.dashboardGridApi.setGridOption(
        'rowData',
        this.filteredShipments
      );

    }

  }

  onCompanyChanged(): void {

    // We will use this later for dashboard filtering.
    this.loadRecentShipments();

  }

  onQuickFilterChanged(
    event: Event
  ): void {

    const value =
      (event.target as HTMLInputElement).value;

    this.dashboardGridApi?.setGridOption(
      'quickFilterText',
      value
    );

  }

  exportCsv(): void {

    this.dashboardGridApi?.exportDataAsCsv({

      fileName: this.getExportFileName()

    });

  }

  onDateRangeChanged(): void {

    this.applyFilters();

  }



  importShopifyOrders(): void {

    if (this.isImportingShopify) {
      return;
    }

    this.isImportingShopify = true;

    this.shipmentService
      .importShopifyOrders()
      .pipe(
        finalize(() => {
          this.isImportingShopify = false;
        })
      )
      .subscribe({

        next: (response) => {

          this.notificationTitle = 'Shopify Import';

          this.notificationMessage =
            `Import completed. Processed ${response.totalOrders} orders.`;

          this.showNotification = true;

          this.loadRecentShipments();

        },

        error: (err) => {

          console.error('Shopify Import Failed', err);

          this.notificationTitle = 'Shopify Import Failed';

          if (err.status === 0) {

            this.notificationMessage =
              'Unable to connect to the server. Please check your network or CORS configuration.';

          } else {

            this.notificationMessage =
              err.error?.error ??
              err.message ??
              'Failed to import Shopify orders.';

          }

          this.showNotification = true;

        }

      });

  }

  updateOrder(): void {

    console.log('Master Order:', this.masterOrderNo);

    // TODO:
    // Call API to update a single order

  }

  onParentCompanyChanged(): void {

    if (!this.isSuperUser) {
      return;
    }

    this.loadChildCompanies(this.parentCompanyId);

  }

  loadParentCompanies(): void {

    this.http
      .get<Companies[]>(
        `${environment.workerDataApi}/internal/companies/parents`
      )
      .subscribe({

        next: (companies: Companies[]) => {

          this.parentCompanies = companies;

          this.parentCompanyId = this.currentUser!.CompanyId;

          this.loadChildCompanies(this.parentCompanyId);


        },

        error: (error: any) => {

          console.error(error);

        }

      });

  }

  loadChildCompanies(parentCompanyId: number): void {

    this.http
      .get<Companies[]>(
        `${environment.workerDataApi}/internal/companies?parent_company_id=${parentCompanyId}`
      )
      .subscribe({

        next: (companies: Companies[]) => {

          this.companyOptions = [
            {
              CompanyId: this.ALL_COMPANIES_ID,
              Name: '---'
            },
            ...companies
          ];

          this.activeCompanyId = this.ALL_COMPANIES_ID;

        },

        error: (error: any) => {

          console.error(error);

        }

      });

  }

  private refreshDashboard(): void {

    this.buildKpiCards();

    this.buildChannelChart();

    this.buildStatusChart();

    this.buildShipmentTrend();

  }

  private applyFilters(): void {

    let shipments = [...this.allShipments];

    // Date Range Filter
    shipments = this.filterByDateRange(shipments);

    this.filteredShipments = shipments;

    if (this.dashboardGridApi) {

      this.dashboardGridApi.setGridOption(
        'rowData',
        this.filteredShipments
      );

    }

    this.refreshDashboard();

  }

  private getExportFileName(): string {

    const now = new Date();

    const day = String(now.getDate()).padStart(2, '0');

    const month = now.toLocaleString('en-SG', {
      month: 'short'
    });

    const year = now.getFullYear();

    const time = now.toLocaleTimeString('en-SG', {
      hour: '2-digit',
      minute: '2-digit',
      second: '2-digit',
      hour12: true
    });

    return `Shipments_${day}-${month}-${year} ${time}.csv`;

  }

  get canBulkUpdate(): boolean {
    const user = this.authService.getCurrentUser();   // or your existing public getter

    if (!user?.Role) {
      return false;
    }

    return user.Role.Code === 'SUPER_USER'
      || user.Role.Code === 'ADMIN';
  }

  private loadRecentShipments(): void {

    this.shipmentService
      .getShipments()
      .subscribe({

        next: (shipments: Shipment[]) => {

          this.allShipments = [...shipments];

          // Apply filters, refresh grid, KPIs and charts
          this.applyFilters();

          this.cdr.detectChanges();

        },

        error: err => {

          console.error(
            'Failed to load shipments.',
            err
          );

        }

      });

  }
  private buildChannelChart(): void {

    const channelCounts = new Map<string, number>();

    for (const shipment of this.filteredShipments) {

      const channel = this.getChannelName(
        shipment.channel
      );

      channelCounts.set(
        channel,
        (channelCounts.get(channel) ?? 0) + 1
      );

    }

    this.channelChartData = {

      labels: Array.from(channelCounts.keys()),

      datasets: [

        {
          data: Array.from(channelCounts.values())
        }

      ]

    };

  }

  private buildStatusChart(): void {

    const statusCounts =
      new Map<string, number>();

    const exceptionStatuses = [
      'Pending',
      'fulfilled',
      'Returned',
      'Lost',
      'Canceled',
      'Unknown'
    ];

    for (const shipment of this.filteredShipments) {

      const status =
        getShipmentStatus(shipment.status ?? 'Unknown').trim();

      if (!exceptionStatuses.includes(status)) {
        continue;
      }

      statusCounts.set(
        status,
        (statusCounts.get(status) ?? 0) + 1
      );

    }

    const sortedStatuses =
      this.sortByStatusOrder(statusCounts);

    const labels =
      sortedStatuses.map(x => x[0]);

    this.statusChartData = {

      labels,

      datasets: [

        {

          label: 'Exception Shipments',

          data: sortedStatuses.map(x => x[1]),

          backgroundColor:
            labels.map(status =>
              this.getStatusColor(status))

        }

      ]

    };

  }

  private buildShipmentTrend(): void {

    const dailyCounts =
      new Map<string, number>();

    for (const shipment of this.filteredShipments) {

      if (!shipment.shipmentDate) {
        continue;
      }

      const date =
        new Date(shipment.shipmentDate);

      if (isNaN(date.getTime())) {
        continue;
      }

      const key =
        date.toISOString().split('T')[0];

      dailyCounts.set(

        key,

        (dailyCounts.get(key) ?? 0) + 1

      );

    }

    const sorted =

      Array.from(dailyCounts.entries())
        .sort((a, b) =>
          a[0].localeCompare(b[0]));

    this.trendChartData = {

      labels:
        sorted.map(x =>
          this.formatDate(x[0])),

      datasets: [

        {

          label: 'Shipments',

          data:
            sorted.map(x => x[1]),

          borderColor: '#2563eb',

          backgroundColor: '#93c5fd',

          tension: 0.3,

          fill: false

        }

      ]

    };

  }
  private getChannelName(
    channel: string | null | undefined
  ): string {

    if (!channel) {

      return 'Unknown';

    }

    switch (channel.trim().toLowerCase()) {

      case 'online store':
        return 'Online Store';

      case 'amazon':
        return 'Amazon';

      case 'shopify_draft_order':
        return 'Shopify Draft';

      case '3890849':
        return '3890849';

      default:
        return channel;

    }

  }

  private sortByStatusOrder(
    statusCounts: Map<string, number>
  ): [string, number][] {

    return Array
      .from(statusCounts.entries())
      .sort((a, b) => {

        const orderA =
          this.statusOrder.indexOf(a[0]);

        const orderB =
          this.statusOrder.indexOf(b[0]);

        return (

          (orderA === -1
            ? Number.MAX_SAFE_INTEGER
            : orderA)

          -

          (orderB === -1
            ? Number.MAX_SAFE_INTEGER
            : orderB)

        );

      });

  }

  private getStatusColor(
    status: string
  ): string {

    switch (status.toLowerCase()) {

      case 'pending pickup':
        return '#f59e0b'; // Amber

      case 'in transit':
        return '#3b82f6'; // Blue

      case 'out for delivery':
        return '#8b5cf6'; // Purple

      case 'delivered':
        return '#22c55e'; // Green

      case 'returned':
        return '#6b7280'; // Gray

      case 'lost':
      case 'canceled':
        return '#ef4444'; // Red

      default:
        return '#94a3b8';
    }

  }

  private formatDate(
    value: string
  ): string {

    return new Date(value)
      .toLocaleDateString(
        'en-US',
        {

          month: 'short',
          day: 'numeric'

        });

  }

  private buildKpiCards(): void {

    this.pendingPickup = 0;
    this.inTransit = 0;
    this.delivered = 0;
    this.exceptions = 0;

    for (const shipment of this.filteredShipments) {

      const status =
        getShipmentStatus(shipment.status ?? "Unknown");

      switch (status) {

        case "Pending Pickup":
          this.pendingPickup++;
          break;

        case "In Transit":
        case "Out for Delivery":
          this.inTransit++;
          break;

        case "Delivered":
          this.delivered++;
          break;

        case "Returned":
        case "Lost":
        case "Canceled":
          this.exceptions++;
          break;

      }

    }

  }

  bulkUpdate(): void {

    if (this.isBulkUpdating) {
      return;
    }

    this.isBulkUpdating = true;

    this.shipmentService
      .bulkUpdate()
      .pipe(
        finalize(() => {
          this.isBulkUpdating = false;
        })
      )
      .subscribe({

        next: (response) => {

          this.notificationTitle = 'Bulk Update';

          this.notificationMessage =
            `Synchronization completed. Processed ${response.totalOrders} orders.`;

          this.showNotification = true;

          this.loadRecentShipments();

        },

        error: (err) => {

          console.error(err);

          this.notificationTitle = 'Bulk Update Failed';

          this.notificationMessage =
            err.error?.error ??
            'Failed to synchronize shipments.';

          this.showNotification = true;

        }

      });

  }

  viewShipment(shipment: Shipment): void {

    if (!shipment.trackingNumber) {

      alert('Tracking number not available.');

      return;

    }

    forkJoin({

      spx: this.shipmentService.getShipmentDetails(
        shipment.trackingNumber
      ),

      shopify: this.shipmentService.getShopifyOrder(
        shipment.orderNo
      )

    }).subscribe({

      next: ({ spx, shopify }) => {

        const spxOrder =
          spx.data.orders.length > 0
            ? spx.data.orders[0]
            : null;

        const shopifyOrder =
          shopify ?? null;

        // Nothing found anywhere
        if (!spxOrder && !shopifyOrder) {

          alert("Order not found.");

          return;

        }

        this.shipmentDialog.open(
          spxOrder,
          shopifyOrder
        );

      },

      error: err => {

        console.error(err);

      }

    });

  }

  historyShipment(shipment: Shipment): void {

    if (!shipment.trackingNumber) {

      return;

    }

    this.shipmentService
      .getShipmentDetails(shipment.trackingNumber)
      .subscribe({

        next: (response: TrackOrderResponse) => {

          if (response.data.orders.length === 0) {

            alert('Shipment not found.');

            return;

          }

          const order = response.data.orders[0];
          console.log('shipmentDialog =', this.shipmentHistoryDialog);
          this.shipmentHistoryDialog.open(order);

        },

        error: err => {

          console.error(err);

        }

      });

  }

}
