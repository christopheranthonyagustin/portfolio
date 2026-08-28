import {
  ChangeDetectorRef,
  Component,
  DestroyRef,
  OnInit,
  inject
} from '@angular/core';
import { forkJoin, of } from 'rxjs';
import { CommonModule } from '@angular/common';
import { AgGridAngular } from 'ag-grid-angular';
import {
  GridApi,
  GridReadyEvent,
  GridSizeChangedEvent,
  ColDef,
  CellClassParams,
  CellStyle,
  RowSelectionOptions,
  themeQuartz
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

import { finalize } from 'rxjs/operators';

import { getShipmentStatus } from '../../../shared/utils/shipment-status.util';

import { FormsModule } from '@angular/forms';
import { SidebarService } from '../../../layout/sidebar/sidebar.service';
import { dateTimeFormatter } from '../../../shared/utils/date-utils';
import { ShipmentActionRendererComponent } from '../../../features/shipments/components/shipment-action-renderer/shipment-action-renderer.component';
import { ShipmentVerificationDialogComponent } from '../../../features/shipments/components/shipment-verification-dialog/shipment-verification-dialog.component';
import { TrackOrderResponse } from '../../../core/models/track-order-response';
import { ViewChild } from '@angular/core';
import { ShipmentHistoryDialogComponent } from '../../../features/shipments/components/shipment-history-dialog/shipment-history-dialog.component';
import { ShipmentAwbDialogComponent } from '../../../features/shipments/components/shipment-awb-dialog/shipment-awb-dialog.component';
import { ShipmentMultipleAwbDialogComponent } from '../../../features/shipments/components/shipment-multiple-awb-dialog/shipment-multiple-awb-dialog.component';
import { Companies } from '../../../core/models/Companies';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../environments/environment';
import { ShipmentEstDialogComponent } from '../../../features/shipments/components/shipment-est-dialog/shipment-est-dialog.component';
import {
  TranslatePipe,
  TranslateService
} from '@ngx-translate/core';
import { StatusDropdownFilterComponent } from '../../../shared/components/status-dropdown-filter/status-dropdown-filter.component';

@Component({
  selector: 'app-dashboard-page',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    TranslatePipe,
    AgGridAngular,
    BaseChartDirective,
    SidebarComponent,
    HeaderComponent,
    FooterComponent,
    ShipmentActionRendererComponent,
    ShipmentVerificationDialogComponent,
    ShipmentHistoryDialogComponent,
    ShipmentAwbDialogComponent,
    ShipmentMultipleAwbDialogComponent,
    ShipmentEstDialogComponent
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

  @ViewChild(ShipmentAwbDialogComponent)
  private shipmentAwbDialog!: ShipmentAwbDialogComponent;

  @ViewChild(ShipmentMultipleAwbDialogComponent)
  private shipmentMultipleAwbDialog!: ShipmentMultipleAwbDialogComponent;

  @ViewChild(ShipmentEstDialogComponent)
  private shipmentEstDialog!: ShipmentEstDialogComponent;

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

  rowSelection: RowSelectionOptions = {
    mode: 'multiRow',
    checkboxes: true,
    headerCheckbox: true
  };

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
  private currentRoleId = 0;
  isDownloadingAwb = false;
  spxOrderNo = '';
  spxWeightMode: 'small' | 'big' | 'custom' = 'small';
  spxWeight: number | null = null;
  public isCancellingSpx = false;
  public isCreationSpx = false;
  showKpiCards = true;
  showCharts = true;
  showColumnSelector = false;

  readonly columnVisibilityOptions = [
    { field: 'trackingNumber', label: 'Tracking No' },
    { field: 'orderNo', label: 'Order No' },
    { field: 'customerName', label: 'Customer' },
    { field: 'status', label: 'Status' },
    { field: 'courier', label: 'Courier' },
    { field: 'channel', label: 'Channel' },
    { field: 'awbCreatedTime', label: 'AWB Created' },
    { field: 'shipmentDate', label: 'Shipment Date' },
    { field: 'lastUpdated', label: 'Last Updated' },
    { field: 'remarks', label: 'Remarks' },
    { field: 'hasException', label: 'Exception' }
  ];


  getGridLocaleText = (params: {
    key: string;
    defaultValue: string;
  }): string => {

    const keyMap: Record<string, string> = {

      // Text Filter
      contains: 'dashboard.grid.contains',
      notContains: 'dashboard.grid.notContains',
      equals: 'dashboard.grid.equals',
      notEqual: 'dashboard.grid.notEqual',
      startsWith: 'dashboard.grid.startsWith',
      endsWith: 'dashboard.grid.endsWith',
      blank: 'dashboard.grid.blank',
      notBlank: 'dashboard.grid.notBlank',

      // Date Filter
      before: 'dashboard.grid.lessThan',
      after: 'dashboard.grid.greaterThan',
      inRange: 'dashboard.grid.inRange',

      // General
      filterOoo: 'dashboard.grid.filterOoo'
    };

    const translationKey = keyMap[params.key];

    if (!translationKey) {
      return params.defaultValue;
    }

    const translated =
      this.translate.instant(translationKey);

    return translated !== translationKey
      ? translated
      : params.defaultValue;
  };

  private readonly translate =
    inject(TranslateService);

  private get isOperatorRole(): boolean {
    return this.currentRoleId > 2;
  }

  private dateFilterComparator(
    filterLocalDateAtMidnight: Date,
    cellValue: any
  ): number {

    if (!cellValue) {
      return -1;
    }

    const cellDate = new Date(cellValue);

    if (isNaN(cellDate.getTime())) {
      return -1;
    }

    // Compare date only
    const cellDateOnly = new Date(
      cellDate.getFullYear(),
      cellDate.getMonth(),
      cellDate.getDate()
    );

    const filterDateOnly = new Date(
      filterLocalDateAtMidnight.getFullYear(),
      filterLocalDateAtMidnight.getMonth(),
      filterLocalDateAtMidnight.getDate()
    );

    if (cellDateOnly < filterDateOnly) {
      return -1;
    }

    if (cellDateOnly > filterDateOnly) {
      return 1;
    }

    return 0;
  }

  readonly defaultColDef: ColDef = {

    sortable: true,
    filter: true,
    floatingFilter: true,
    resizable: true
    

  };


  readonly dashboardColumnDefs: ColDef[] = [

    {
      field: 'trackingNumber',
      headerName: 'Tracking No',
      headerValueGetter: () =>
        this.translate.instant(
          'dashboard.recentShipments.columnsList.trackingNumber'
        ),
      minWidth: 120,
      sortable: false,
    },

    {
      field: 'orderNo',
      headerName: 'Order No',
      headerValueGetter: () =>
        this.translate.instant(
          'dashboard.recentShipments.columnsList.orderNo'
        ),
      width: 120,
      sortable: false,
    },

    {
      field: 'customerName',
      headerName: 'Customer',
      headerValueGetter: () =>
        this.translate.instant(
          'dashboard.recentShipments.columnsList.customer'
        ),
      minWidth: 220,
      sortable: false,
    },

    {
      field: 'status',
      headerName: 'Status',
      headerValueGetter: () =>
        this.translate.instant(
          'dashboard.recentShipments.columnsList.status'
        ),

      width: 170,
      sortable: false,
      // Custom filter opens as a popup
      filter: StatusDropdownFilterComponent,

      // Do NOT render the dropdown directly in the filter row
      floatingFilter: true,

      // IMPORTANT for the legacy custom filter
      floatingFilterComponentParams: {
        suppressFilterButton: true
      },

      valueFormatter: params => {

        const status =
          getShipmentStatus(params.value);

        const key =
          this.getStatusTranslationKey(status);

        return this.translate.instant(
          `dashboard.recentShipments.statusFilter.statuses.${key}`
        );
      },

      cellStyle: (params: CellClassParams): CellStyle | null => {

        const status =
          getShipmentStatus(params.value);

        switch (status) {

          case 'Unfulfilled':
          case 'Partial':
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

          case 'On Hold':
            return {
              backgroundColor: '#FEF3C7',
              color: '#92400E',
              fontWeight: '600'
            };

          case 'Self Collect':
            return {
              backgroundColor: '#E0E7FF',
              color: '#3730A2',
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
          case 'Restocked':
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
      field: 'courier',
      headerName: 'Courier',
      headerValueGetter: () =>
        this.translate.instant(
          'dashboard.recentShipments.columnsList.courier'
        ),
      width: 120,
      sortable: false,
      valueFormatter: params => {
        if (params.value === 'To Ship') {
          return this.translate.instant(
            'dashboard.recentShipments.courier.toShip'
          );
        }

        return params.value || '';
      }
    },

    {
      field: 'channel',
      headerName: 'Channel',
      headerValueGetter: () =>
        this.translate.instant(
          'dashboard.recentShipments.columnsList.channel'
        ),
      width: 120,
      sortable: false,
      valueFormatter: params => {

        const value = String(params.value ?? '').trim();

        switch (value.toLowerCase()) {

          case 'facebook & instagram':
            return this.translate.instant(
              'dashboard.recentShipments.channel.facebookInstagram'
            );

          case 'google & youtube':
            return this.translate.instant(
              'dashboard.recentShipments.channel.googleYoutube'
            );

          case 'shopify inbox':
            return this.translate.instant(
              'dashboard.recentShipments.channel.shopifyInbox'
            );

          case 'marketplace connect':
            return this.translate.instant(
              'dashboard.recentShipments.channel.marketplaceConnect'
            );

          case 'online store':
            return this.translate.instant(
              'dashboard.recentShipments.channel.onlineStore'
            );

          case 'pinterest':
            return this.translate.instant(
              'dashboard.recentShipments.channel.pinterest'
            );

          case 'point of sale':
            return this.translate.instant(
              'dashboard.recentShipments.channel.pointOfSale'
            );

          case 'shop':
            return this.translate.instant(
              'dashboard.recentShipments.channel.shop'
            );

          case 'tiktok':
            return this.translate.instant(
              'dashboard.recentShipments.channel.tiktok'
            );

          default:
            // Unknown channel → keep the original value
            return value;
        }
      }
    },

    {
      field: 'awbCreatedTime',
      headerName: 'AWB Created',
      headerValueGetter: () =>
        this.translate.instant(
          'dashboard.recentShipments.columnsList.awbCreated'
        ),
      minWidth: 170,
      valueFormatter: params =>
        dateTimeFormatter(params.value),
      filter: 'agDateColumnFilter',
      filterParams: {
        includeTime: false,
        comparator: (
          filterLocalDateAtMidnight: Date,
          cellValue: any
        ) =>
          this.dateFilterComparator(
            filterLocalDateAtMidnight,
            cellValue
          )
      }
    },

    {
      field: 'shipmentDate',
      headerName: 'Shipment Date',
      headerValueGetter: () =>
        this.translate.instant(
          'dashboard.recentShipments.columnsList.shipmentDate'
        ),
      minWidth: 170,
      valueFormatter: params =>
        dateTimeFormatter(params.value),
      filter: 'agDateColumnFilter',
      filterParams: {
        includeTime: false,
        comparator: (
          filterLocalDateAtMidnight: Date,
          cellValue: any
        ) =>
          this.dateFilterComparator(
            filterLocalDateAtMidnight,
            cellValue
          )
      }
    },

    {
      field: 'lastUpdated',
      headerName: 'Last Updated',
      headerValueGetter: () =>
        this.translate.instant(
          'dashboard.recentShipments.columnsList.lastUpdated'
        ),
      minWidth: 170,
      valueFormatter: params =>
        dateTimeFormatter(params.value),
      filter: 'agDateColumnFilter',
      filterParams: {
        includeTime: false,
        comparator: (
          filterLocalDateAtMidnight: Date,
          cellValue: any
        ) =>
          this.dateFilterComparator(
            filterLocalDateAtMidnight,
            cellValue
          )
      }
    },

    {
      field: 'remarks',
      headerName: 'Remarks',
      headerValueGetter: () =>
        this.translate.instant(
          'dashboard.recentShipments.columnsList.remarks'
        ),
      minWidth: 220,
      sortable: false,
      valueFormatter: params => {
        if (!params.value) {
          return '';
        }

        if (params.value === 'No AWB') {
          return this.translate.instant(
            'dashboard.recentShipments.remarks.noAwb'
          );
        }

        return params.value;
      }
    },

    {
      field: 'hasException',
      headerName: 'Exception',
      headerValueGetter: () =>
        this.translate.instant(
          'dashboard.recentShipments.columnsList.exception'
        ),
      width: 110,
      sortable: false,
      valueFormatter: params =>
        params.value ? '⚠ Yes' : ''
    },

    {
      colId: 'actions',
      headerName: 'Actions',
      headerValueGetter: () =>
        this.translate.instant(
          'dashboard.recentShipments.columnsList.actions'
        ),
      sortable: false,
      filter: false,
      width: 180,
      pinned: 'right',
      cellRenderer: ShipmentActionRendererComponent,
      cellRendererParams: {
        onView: (shipment: Shipment) =>
          this.viewShipment(shipment),

        onHistory: (shipment: Shipment) =>
          this.historyShipment(shipment),

        onAwb: (shipment: Shipment) =>
          this.awbShipment(shipment),

        onEstimate: (shipment: Shipment) =>
          this.estimateShipment(shipment)
      }
    }

  ];

  private updateRoleColumnVisibility(): void {

    if (!this.dashboardGridApi) {
      return;
    }

    const hideOperatorColumns =
      this.isOperatorRole;

    this.dashboardGridApi.setColumnsVisible(
      [
        'awbCreatedTime',
        'shipmentDate',
        'lastUpdated',
        'remarks',
        'courier',
        'channel',
        'hasException'
      ],
      !hideOperatorColumns
    );

  }

  private readonly statusOrder = [
    'Unfulfilled',
    'Partial',
    'Pending Pickup',
    'In Transit',
    'Out for Delivery',
    'Delivered',
    'Returned',
    'Lost',
    'Canceled',
    'Restocked',
    'On Hold',
    'Self Collect'
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

    this.currentRoleId =
      this.currentUser.Role?.RoleId ?? 0;

    // Default parent company
    this.parentCompanyId = this.currentUser.CompanyId;

    if (this.isSuperUser) {

      // Super User
      this.loadParentCompanies();

      this.activeCompanyId = this.currentUser.CompanyId;

    }
    else if (this.currentUser.Role?.RoleId === 2) {

      // Administrator
      this.companyOptions = [
        {
          CompanyId: this.ALL_COMPANIES_ID,
          Name: '---'
        },
        ...this.companies
      ];

      this.activeCompanyId = this.ALL_COMPANIES_ID;

    }
    else {

      // Operator / Viewer
      this.companyOptions = [...this.companies];

      this.activeCompanyId = this.companies[0]?.CompanyId ?? 0;

    }

    this.loadRecentShipments();

    const notification = history.state?.notification;

    if (notification) {

      this.notificationTitle = notification.title;
      this.notificationMessage = notification.message;
      this.showNotification = true;

      const timer = window.setTimeout(() => {
        this.showNotification = false;
        this.cdr.detectChanges();
      }, 3000);

      this.destroyRef.onDestroy(() =>
        clearTimeout(timer)
      );
    }

    this.translate.onLangChange.subscribe(() => {
      this.dashboardGridApi?.refreshHeader();
    });

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

    this.updateRoleColumnVisibility();
    this.dashboardGridApi.refreshHeader();

  }

  onCompanyChanged(): void {

    // We will use this later for dashboard filtering.
    this.loadRecentShipments();

  }

  onGridSizeChanged(
    event: GridSizeChangedEvent
  ): void {
    // Do not call sizeColumnsToFit().
    // Allow the grid to maintain its natural column widths
    // and horizontal scrolling.
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

  toggleKpiCards(): void {
    this.showKpiCards = !this.showKpiCards;
  }

  toggleCharts(): void {
    this.showCharts = !this.showCharts;
  }

  toggleColumnSelector(): void {
    this.showColumnSelector = !this.showColumnSelector;
  }

  toggleColumn(field: string, event: Event): void {
    const checked = (event.target as HTMLInputElement).checked;

    this.dashboardGridApi?.setColumnsVisible(
      [field],
      checked
    );
  }

  isColumnVisible(field: string): boolean {
    const column = this.dashboardGridApi?.getColumn(field);

    return column?.isVisible() ?? true;
  }

  showAllColumns(): void {
    const fields = this.columnVisibilityOptions.map(
      column => column.field
    );

    this.dashboardGridApi?.setColumnsVisible(
      fields,
      true
    );
  }

  toggleColumnVisibility(
    columnId: string,
    event: Event
  ): void {
    const checked =
      (event.target as HTMLInputElement).checked;

    this.dashboardGridApi?.setColumnsVisible(
      [columnId],
      checked
    );
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

    const channelCounts =
      new Map<string, number>();

    for (const shipment of this.filteredShipments) {

      const channel =
        this.getChannelName(
          shipment.channel
        );

      channelCounts.set(
        channel,
        (channelCounts.get(channel) ?? 0) + 1
      );

    }


    const channels =
      Array.from(channelCounts.keys());


    const labels =
      channels.map(
        channel =>
          this.translate.instant(
            `dashboard.charts.shipmentByChannel.channels.${this.getChannelTranslationKey(channel)}`
          )
      );


    this.channelChartData = {

      labels,

      datasets: [

        {
          data:
            Array.from(
              channelCounts.values()
            )
        }

      ]

    };

  }

  private getChannelTranslationKey(
    channel: string
  ): string {

    switch (channel.trim().toLowerCase()) {

      case 'online store':
        return 'onlineStore';

      case 'shopify draft':
        return 'shopifyDraft';

      case 'pos':
        return 'pos';

      case 'unknown':
        return 'unknown';

      case 'online store: channel_pos, offline_order, source_qr':
        return 'onlineStorePosOfflineOrderQr';

      default:
        return 'unknown';
    }

  }

  private buildStatusChart(): void {

    const statusCounts =
      new Map<string, number>();

    const exceptionStatuses = [
      'Pending',
      'Unfulfilled',
      'Fulfilled',
      'Returned',
      'Lost',
      'Canceled',
      'Unknown'
    ];

    for (const shipment of this.filteredShipments) {

      const status =
        getShipmentStatus(
          shipment.status ?? 'Unknown'
        ).trim();

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


    // ==========================================================
    // Translate Chart Labels
    // ==========================================================

    const labels =
      sortedStatuses.map(
        ([status]) =>
          this.translate.instant(
            `dashboard.charts.otherStatuses.statuses.${this.getStatusTranslationKey(status)}`
          )
      );


    this.statusChartData = {

      labels,

      datasets: [

        {

          label: this.translate.instant(
            'dashboard.charts.otherStatuses.datasetLabel'
          ),

          data:
            sortedStatuses.map(
              ([, count]) => count
            ),

          backgroundColor:
            sortedStatuses.map(
              ([status]) =>
                this.getStatusColor(status)
            )

        }

      ]

    };

  }

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

      case 'unknown':
        return 'unknown';

      default:
        return 'unknown';
    }
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
          this.formatTrendDate(x[0])),

      datasets: [

        {

          label: this.translate.instant(
            'dashboard.charts.shipmentTrend.datasetLabel'
          ),

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

  private formatTrendDate(
    date: string
  ): string {

    const value =
      new Date(date);

    if (isNaN(value.getTime())) {
      return date;
    }

    const language =
      localStorage.getItem(
        'logivis-language'
      ) ?? 'en';

    if (language === 'zh') {

      return new Intl.DateTimeFormat(
        'zh-CN',
        {
          month: 'short',
          day: 'numeric'
        }
      ).format(value);

    }

    return new Intl.DateTimeFormat(
      'en-US',
      {
        month: 'short',
        day: 'numeric'
      }
    ).format(value);

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

  downloadMultipleAwb(): void {

    const selectedShipments =
      this.dashboardGridApi?.getSelectedRows() ?? [];

    // ----------------------------------------------------------
    // Minimum 1 selection
    // ----------------------------------------------------------

    if (selectedShipments.length === 0) {

      alert(
        'Please select at least one shipment.'
      );

      return;
    }

    // ----------------------------------------------------------
    // Maximum 5 selections
    // ----------------------------------------------------------

    if (selectedShipments.length > 5) {

      alert(
        'You can select a maximum of 5 shipments at a time.'
      );

      return;
    }

    console.log(
      '[AWB] Selected shipments:',
      selectedShipments
    );

    // ----------------------------------------------------------
    // Open existing AWB Preview
    // ----------------------------------------------------------

    this.shipmentMultipleAwbDialog.openMultiple(
      selectedShipments
    );



  }

  viewShipment(shipment: Shipment): void {

    const trackingNumber =
      shipment.trackingNumber?.trim() ?? '';

    forkJoin({
      shopify:
        this.shipmentService.getShopifyOrder(
          shipment.orderNo
        )
    }).subscribe({

      next: ({ shopify }) => {

        const shopifyOrder =
          shopify ?? null;

        // ----------------------------------------------------------
        // Determine SPX tracking number
        // ----------------------------------------------------------

        const shopifyTrackingNumber =
          shopifyOrder?.fulfillments?.[0]
            ?.trackingNumber
            ?.trim() ?? '';

        const spxTrackingNumber =
          trackingNumber ||
          shopifyTrackingNumber;

        console.log(
          '[VERIFY] Lark Tracking:',
          trackingNumber
        );

        console.log(
          '[VERIFY] Shopify Tracking:',
          shopifyTrackingNumber
        );

        console.log(
          '[VERIFY] SPX Tracking Used:',
          spxTrackingNumber
        );

        // ----------------------------------------------------------
        // Get SPX shipment
        // ----------------------------------------------------------

        const spxRequest =
          spxTrackingNumber
            ? this.shipmentService.getShipmentDetails(
              spxTrackingNumber
            )
            : of(null);

        spxRequest.subscribe({

          next: spx => {

            const spxOrder =
              spx?.data?.orders?.length > 0
                ? spx.data.orders[0]
                : null;

            // ------------------------------------------------------
            // Nothing found anywhere
            // ------------------------------------------------------

            if (!spxOrder && !shopifyOrder) {

              alert(
                "Order not found."
              );

              return;
            }

            this.shipmentDialog.open(
              spxOrder,
              shopifyOrder
            );

          },

          error: err => {

            console.error(
              '[SPX VERIFY ERROR]',
              err
            );

            // Still show Shopify information
            // even if SPX lookup fails.

            this.shipmentDialog.open(
              null,
              shopifyOrder
            );

          }

        });

      },

      error: err => {

        console.error(
          '[SHOPIFY VERIFY ERROR]',
          err
        );

      }

    });

  }

  historyShipment(shipment: Shipment): void {

    const trackingNumber =
      shipment.trackingNumber?.trim() ?? '';

    // ----------------------------------------------------------
    // Tracking number already exists
    // ----------------------------------------------------------

    if (trackingNumber) {

      this.shipmentService
        .getShipmentDetails(trackingNumber)
        .subscribe({

          next: (response: TrackOrderResponse) => {

            if (
              response.data.orders.length === 0
            ) {

              alert(
                'Shipment not found.'
              );

              return;
            }

            const order =
              response.data.orders[0];

            this.shipmentHistoryDialog.open(
              order
            );

          },

          error: err => {

            console.error(
              '[HISTORY] Failed to load SPX history',
              err
            );

          }

        });

      return;
    }

    // ----------------------------------------------------------
    // No tracking number in Lark
    // Get Shopify order first
    // ----------------------------------------------------------

    this.shipmentService
      .getShopifyOrder(
        shipment.orderNo
      )
      .subscribe({

        next: shopifyOrder => {

          const shopifyTracking =
            shopifyOrder?.fulfillments?.[0]
              ?.trackingNumber
              ?.trim() ?? '';

          if (!shopifyTracking) {

            alert(
              'Shipment history is not available because there is no delivery tracking number.'
            );

            return;
          }

          this.shipmentService
            .getShipmentDetails(
              shopifyTracking
            )
            .subscribe({

              next: (
                response: TrackOrderResponse
              ) => {

                if (
                  response.data.orders.length === 0
                ) {

                  alert(
                    'Shipment not found.'
                  );

                  return;
                }

                const order =
                  response.data.orders[0];

                this.shipmentHistoryDialog.open(
                  order
                );

              },

              error: err => {

                console.error(
                  '[HISTORY] Failed to load SPX history',
                  err
                );

              }

            });

        },

        error: err => {

          console.error(
            '[HISTORY] Failed to load Shopify order',
            err
          );

        }

      });

  }


  awbShipment(shipment: Shipment): void {

    const larkTrackingNumber =
      shipment.trackingNumber?.trim() ?? '';

    this.shipmentService
      .getShopifyOrder(shipment.orderNo)
      .subscribe({

        next: shopify => {

          const shopifyOrder =
            shopify ?? null;

          // ----------------------------------------------------------
          // Determine tracking number
          // ----------------------------------------------------------

          const shopifyTrackingNumber =
            shopifyOrder?.fulfillments?.[0]
              ?.trackingNumber
              ?.trim() ?? '';

          const trackingNumber =
            larkTrackingNumber ||
            shopifyTrackingNumber;

          console.log(
            '[AWB] Lark Tracking:',
            larkTrackingNumber
          );

          console.log(
            '[AWB] Shopify Tracking:',
            shopifyTrackingNumber
          );

          console.log(
            '[AWB] Tracking Used:',
            trackingNumber
          );

          // ----------------------------------------------------------
          // No tracking number anywhere
          // ----------------------------------------------------------

          if (!trackingNumber) {

            alert(
              'AWB is not available because there is no delivery order yet.'
            );

            return;
          }

          // ----------------------------------------------------------
          // Get SPX shipment
          // ----------------------------------------------------------

          this.shipmentService
            .getShipmentDetails(trackingNumber)
            .subscribe({

              next: (response: TrackOrderResponse) => {

                if (
                  !response.data.orders ||
                  response.data.orders.length === 0
                ) {

                  alert('Shipment not found.');

                  return;
                }

                const order =
                  response.data.orders[0];

                this.shipmentAwbDialog.open(order);

              },

              error: err => {

                console.error(
                  '[AWB ERROR]',
                  err
                );

              }

            });

        },

        error: err => {

          console.error(
            '[SHOPIFY AWB ERROR]',
            err
          );

        }

      });

  }


  estimateShipment(shipment: Shipment): void {

    const isSelfCollect =
      shipment.status?.trim().toLowerCase() === 'self collect';

    if (isSelfCollect) {
      alert('Estimate is not applicable for Self Collect orders.');
      return;
    }

    this.shipmentService
      .getShopifyOrder(shipment.orderNo)
      .subscribe({

        next: shopify => {

          const shopifyOrder =
            shopify ?? null;

          // ----------------------------------------------------------
          // Determine SPX tracking number
          // ----------------------------------------------------------

          const larkTrackingNumber =
            shipment.trackingNumber?.trim() ?? '';

          const shopifyTrackingNumber =
            shopifyOrder?.fulfillments?.[0]
              ?.trackingNumber
              ?.trim() ?? '';

          const spxTrackingNumber =
            larkTrackingNumber ||
            shopifyTrackingNumber;

          console.log(
            '[ESTIMATE] Lark Tracking:',
            larkTrackingNumber
          );

          console.log(
            '[ESTIMATE] Shopify Tracking:',
            shopifyTrackingNumber
          );

          console.log(
            '[ESTIMATE] SPX Tracking Used:',
            spxTrackingNumber
          );

          // ----------------------------------------------------------
          // Get SPX shipment
          // ----------------------------------------------------------

          const spxRequest =
            spxTrackingNumber
              ? this.shipmentService.getShipmentDetails(
                spxTrackingNumber
              )
              : of(null);

          spxRequest.subscribe({

            next: spx => {

              const spxOrder =
                spx?.data?.orders?.length > 0
                  ? spx.data.orders[0]
                  : null;

              if (!spxOrder && !shopifyOrder) {
                alert('Order not found.');
                return;
              }

              this.shipmentEstDialog.open(
                spxOrder,
                shopifyOrder
              );

            },

            error: err => {

              console.error(
                '[SPX ESTIMATE ERROR]',
                err
              );

              // Still allow the dialog to use Shopify data
              this.shipmentEstDialog.open(
                null,
                shopifyOrder
              );

            }

          });

        },

        error: err => {

          console.error(
            '[SHOPIFY ESTIMATE ERROR]',
            err
          );

        }

      });

  }

  createSpxOrder(): void {

    const selectedShipments =
      this.dashboardGridApi?.getSelectedRows() ?? [];

    // ----------------------------------------------------------
    // Prevent multiple clicks
    // ----------------------------------------------------------

    if (this.isCreationSpx) {
      return;
    }

    // ----------------------------------------------------------
    // Validate selection
    // ----------------------------------------------------------

    if (selectedShipments.length === 0) {

      alert(
        'Please select at least one shipment.'
      );

      return;
    }

    if (selectedShipments.length > 5) {

      alert(
        'You can select a maximum of 5 shipments.'
      );

      return;
    }

    // ----------------------------------------------------------
    // Determine weight
    // ----------------------------------------------------------

    let weight: number | null = null;

    switch (this.spxWeightMode) {

      case 'small':
        weight = 3;
        break;

      case 'big':
        weight = 15;
        break;

      case 'custom':
        weight = this.spxWeight;
        break;

    }

    // ----------------------------------------------------------
    // Validate weight
    // ----------------------------------------------------------

    if (
      weight === null ||
      !Number.isFinite(weight) ||
      weight <= 0
    ) {

      alert(
        'Please enter a valid custom weight.'
      );

      return;
    }

    // ==========================================================
    // START SPX CREATION
    // ==========================================================

    this.isCreationSpx = true;

    console.log(
      '[SPX] Creation started.'
    );

    // ----------------------------------------------------------
    // Pickup date = today + 3 days
    // ----------------------------------------------------------

    const pickupDate = new Date();

    pickupDate.setHours(0, 0, 0, 0);

    pickupDate.setDate(
      pickupDate.getDate() + 3
    );

    const targetDate =
      this.formatSpxPickupDate(pickupDate);

    console.log(
      '[SPX] Quick Create Order:',
      {
        shipments: selectedShipments,
        weight,
        weightMode: this.spxWeightMode,
        targetPickupDate: targetDate
      }
    );

    // ----------------------------------------------------------
    // Get available SPX pickup times
    // ----------------------------------------------------------

    this.shipmentService
      .getPickupTime()
      .subscribe({

        next: (response: any) => {

          console.log(
            '[SPX] Pickup Time Response:',
            response
          );

          if (
            response?.ret_code !== 0 ||
            !Array.isArray(response?.data)
          ) {

            alert(
              response?.message ||
              'Unable to get available SPX pickup times.'
            );

            this.isCreationSpx = false;

            return;
          }

          // ----------------------------------------------------
          // Find requested pickup date
          // ----------------------------------------------------

          const pickup =
            response.data.find(
              (item: any) =>
                item?.date === targetDate
            );

          if (!pickup) {

            console.error(
              '[SPX] Pickup date not available:',
              targetDate
            );

            alert(
              `SPX pickup is not available for ${targetDate}.`
            );

            this.isCreationSpx = false;

            return;
          }

          if (
            !Array.isArray(pickup.slots) ||
            pickup.slots.length === 0
          ) {

            alert(
              `No SPX pickup slot is available for ${targetDate}.`
            );

            this.isCreationSpx = false;

            return;
          }

          // ----------------------------------------------------
          // Use first available slot
          // ----------------------------------------------------

          const slot =
            pickup.slots[0];

          console.log(
            '[SPX] Selected Pickup Slot:',
            {
              date: pickup.date,
              pickupTime: pickup.pickup_time,
              pickupTimeRangeId:
                slot.pickup_time_range_id,
              pickupTimeRange:
                slot.pickup_time_range
            }
          );

          // ----------------------------------------------------
          // Create SPX orders
          // ----------------------------------------------------

          this.createSpxOrders(
            selectedShipments,
            weight!,
            pickup,
            slot
          );

        },

        error: (err: any) => {

          console.error(
            '[SPX] Get Pickup Time Error:',
            err
          );

          alert(
            'Unable to get available SPX pickup times.'
          );

          this.isCreationSpx = false;

        }

      });

  }

  private formatSpxPickupDate(date: Date): string {

    const year =
      date.getFullYear();

    const month =
      String(date.getMonth() + 1).padStart(2, '0');

    const day =
      String(date.getDate()).padStart(2, '0');

    return `${year}-${month}-${day}`;

  }

  private createSpxOrders(
    shipments: Shipment[],
    weight: number,
    pickup: any,
    slot: any
  ): void {


    // ----------------------------------------------------------
    // Get Shopify orders
    // ----------------------------------------------------------

    forkJoin(
      shipments.map(shipment =>
        this.shipmentService.getShopifyOrder(
          shipment.orderNo
        )
      )
    ).subscribe({

      next: (shopifyOrders) => {

        console.log(
          '[SPX] Shopify Orders:',
          shopifyOrders
        );

        // --------------------------------------------------------
        // Build SPX orders
        // --------------------------------------------------------

        const orders = shipments.map(
          (shipment, index) => {

            const shopifyOrder =
              shopifyOrders[index];

            const shippingAddress =
              shopifyOrder?.shippingAddress;

            console.log(
              `[SPX] Shopify Order ${shipment.orderNo}:`,
              shopifyOrder
            );

            console.log(
              `[SPX] Shipping Address ${shipment.orderNo}:`,
              shippingAddress
            );

            // ----------------------------------------------------
            // Validate receiver
            // ----------------------------------------------------

            if (!shippingAddress) {

              throw new Error(
                `Shipping address is not available for Shopify Order ${shipment.orderNo}.`
              );

            }

            if (!shippingAddress.zip) {

              throw new Error(
                `Receiver postal code is missing for Shopify Order ${shipment.orderNo}.`
              );

            }

            if (!shippingAddress.name) {

              throw new Error(
                `Receiver name is missing for Shopify Order ${shipment.orderNo}.`
              );

            }

            if (!shippingAddress.phone) {

              throw new Error(
                `Receiver phone number is missing for Shopify Order ${shipment.orderNo}.`
              );

            }

            if (!shippingAddress.address1) {

              throw new Error(
                `Receiver address is missing for Shopify Order ${shipment.orderNo}.`
              );

            }

            // ----------------------------------------------------
            // Build receiver address
            // ----------------------------------------------------

            const deliverDetailAddress = [
              shippingAddress.address1,
              shippingAddress.address2
            ]
              .filter(value => !!value?.trim())
              .join(' ');

            // ----------------------------------------------------
            // Build SPX Order
            // ----------------------------------------------------

            return {

              order_id:
                shipment.orderNo,

              base_info: {

                service_type: 1

              },

              sender_info: {

                sender_post_code:
                  '528880',

                sender_name:
                  'W Network Private Limited',

                sender_phone:
                  this.normalizeSpxPhone(
                    '80475798'
                  ),

                sender_detail_address:
                  '35 TAMPINES STREET 92',

                sender_unit_no:
                  '#03-01'

              },

              fulfillment_info: {

                payment_role: 1,

                collect_type: 1,

                pickup_time:
                  pickup.pickup_time,

                pickup_time_range_id:
                  slot.pickup_time_range_id,

                pickup_time_range:
                  slot.pickup_time_range

              },

              deliver_info: {

                deliver_post_code:
                  shippingAddress.zip,

                deliver_name:
                  shippingAddress.name,

                deliver_phone:
                  this.normalizeSpxPhone(
                    shippingAddress.phone
                  ),

                deliver_detail_address:
                  deliverDetailAddress

              },

              parcel_info: {

                parcel_weight:
                  weight,

                parcel_item_name:
                  'General Item',

                parcel_item_quantity:
                  1

              }

            };

          }
        );

        const request = {
          orders
        };

        // --------------------------------------------------------
        // Create SPX orders
        // --------------------------------------------------------

        this.shipmentService
          .createSpxOrders(request)
          .subscribe({

            next: (response: any) => {

              console.log(
                '[SPX] Create Order Response:',
                response
              );

              // --------------------------------------------------
              // SPX API failure
              // --------------------------------------------------

              if (response?.ret_code !== 0) {

                console.error(
                  '[SPX] Create Order Failed:',
                  response
                );

                const message =
                  response?.message ||
                  response?.data?.fail_list?.[0]?.message ||
                  'Unable to create the SPX order.';

                alert(message);

                return;
              }

              // --------------------------------------------------
              // Results
              // --------------------------------------------------

              const createdOrders =
                response?.data?.orders ?? [];

              const failedOrders =
                response?.data?.fail_list ?? [];

              console.log(
                '[SPX] Created Orders:',
                createdOrders
              );

              console.log(
                '[SPX] Failed Orders:',
                failedOrders
              );

              // --------------------------------------------------
              // No successful orders
              // --------------------------------------------------

              if (createdOrders.length === 0) {

                const message =
                  failedOrders
                    .map(
                      (failed: any) =>
                        `${failed.order_id}: ${failed.message}`
                    )
                    .join('\n') ||
                  'No SPX orders were created.';

                alert(message);

                return;
              }

              // --------------------------------------------------
              // Process created orders
              // --------------------------------------------------

              createdOrders.forEach(
                (createdOrder: any) => {

                  const orderId =
                    String(
                      createdOrder.order_id ?? ''
                    ).trim();

                  const trackingNumber =
                    String(
                      createdOrder.tracking_no ?? ''
                    ).trim();

                  console.log(
                    '[SPX] Created Order ID:',
                    orderId
                  );

                  console.log(
                    '[SPX] Created Tracking Number:',
                    trackingNumber
                  );

                  // ------------------------------------------------
                  // Tracking number is required
                  // ------------------------------------------------

                  if (!trackingNumber) {

                    console.error(
                      '[SPX] Created order has no tracking number:',
                      createdOrder
                    );

                    return;
                  }

                  // ------------------------------------------------
                  // Find original Lark shipment
                  //
                  // IMPORTANT:
                  // Use the original shipment/order ID.
                  // Do NOT search SPX again.
                  // ------------------------------------------------

                  const shipment =
                    shipments.find(
                      s =>
                        String(s.orderNo).trim() ===
                        orderId
                    );

                  if (!shipment) {

                    console.error(
                      `[SPX] Cannot find original shipment for order ${orderId}.`
                    );

                    return;
                  }

                  console.log(
                    '[SPX] Shipment matched:',
                    shipment
                  );

                  // ------------------------------------------------
                  // Ready to update Lark
                  // ------------------------------------------------

                  console.log(
                    '[SPX] Ready to update Lark:',
                    {
                      recordId:
                        shipment.recordId,

                      orderId,

                      trackingNumber,

                      courier:
                        'SPX'
                    }
                  );

                  // ------------------------------------------------
                  // NEXT:
                  // Update Lark record here.
                  // ------------------------------------------------

                }
              );

              // --------------------------------------------------
              // Partial failures
              // --------------------------------------------------

              if (failedOrders.length > 0) {

                console.warn(
                  '[SPX] Some orders failed:',
                  failedOrders
                );

              }

              // --------------------------------------------------
              // Result message
              // --------------------------------------------------

              if (
                createdOrders.length > 0 &&
                failedOrders.length === 0
              ) {

                // Refresh dashboard with latest Lark data
                this.loadRecentShipments();
     
                alert(
                  `${createdOrders.length} SPX order(s) created successfully.`
                );

                this.isCreationSpx = false;

              }
              else {

                alert(
                  `${createdOrders.length} SPX order(s) created successfully, ` +
                  `${failedOrders.length} order(s) failed.`
                );

                this.isCreationSpx = false;

              }

            },

            // ----------------------------------------------------
            // HTTP / Network error
            // ----------------------------------------------------

            error: (err: any) => {

              console.error(
                '[SPX] Create Order HTTP Error:',
                err
              );

              console.error(
                '[SPX] Error Status:',
                err?.status
              );

              console.error(
                '[SPX] Error Body:',
                err?.error
              );

              const message =
                err?.error?.message ||
                err?.error?.error ||
                err?.message ||
                'Unable to create the SPX order.';

              alert(message);

              this.isCreationSpx = false;

            }

          });

      },

      // ----------------------------------------------------------
      // Shopify lookup error
      // ----------------------------------------------------------

      error: (err: any) => {

        console.error(
          '[SHOPIFY SPX] Unable to retrieve Shopify orders:',
          err
        );

        alert(
          'Unable to retrieve the Shopify order details.'
        );

        this.isCreationSpx = false;

      }

    });

  }
  

  private normalizeSpxPhone(phone: string | null | undefined): string {

    const digits =
      String(phone ?? '')
        .replace(/\D/g, '');

    // Singapore number with country code
    if (digits.startsWith('65')) {

      if (digits.length !== 10) {
        throw new Error(
          `Invalid Singapore phone number: ${phone}. SPX requires 10 digits including country code 65.`
        );
      }

      return digits;
    }

    // Singapore local 8-digit number
    if (digits.length === 8) {
      return `65${digits}`;
    }

    // Other country numbers
    return digits;
  }

  public cancelSpxOrder(): void {

    // ==========================================================
    // Prevent multiple clicks
    // ==========================================================

    if (this.isCancellingSpx) {
      return;
    }

    console.log(
      "[SPX] Cancel SPX Order clicked."
    );

    const selectedShipments =
      this.dashboardGridApi?.getSelectedRows() ?? [];

    console.log(
      "[SPX] Selected Shipments:",
      selectedShipments
    );

    // ==========================================================
    // Validate selection
    // ==========================================================

    if (selectedShipments.length === 0) {

      alert(
        "Please select at least one shipment."
      );

      return;
    }

    const spxShipments =
      selectedShipments.filter(
        (shipment: Shipment) =>
          !!shipment.trackingNumber?.trim()
      );

    if (spxShipments.length === 0) {

      alert(
        "Please select a shipment with an SPX tracking number."
      );

      return;
    }

    const trackingNumbers =
      spxShipments.map(
        (shipment: Shipment) =>
          shipment.trackingNumber.trim()
      );

    console.log(
      "[SPX] Tracking Numbers:",
      trackingNumbers
    );

    // ==========================================================
    // Confirmation
    // ==========================================================

    const confirmed =
      confirm(
        `Cancel ${trackingNumbers.length} SPX order(s)?`
      );

    if (!confirmed) {

      console.log(
        "[SPX] Cancellation cancelled by user."
      );

      return;
    }

    // ==========================================================
    // START LOADING
    // ==========================================================

    this.isCancellingSpx = true;

    console.log(
      "[SPX] Cancellation started."
    );

    console.log(
      "[SPX] Sending cancellation request..."
    );

    // ==========================================================
    // Cancel SPX orders
    // ==========================================================

    this.shipmentService
      .cancelSpxOrders({
        tracking_no_list:
          trackingNumbers
      })
      .pipe(
        finalize(() => {

          // Always stop hourglass / re-enable button
          this.isCancellingSpx = false;

          console.log(
            "[SPX] Cancellation finished."
          );

        })
      )
      .subscribe({

        next: (response: any) => {

          console.log(
            "[SPX] Cancel Order Response:",
            response
          );

          const cancelled =
            response?.data?.tracking_no_list ?? [];

          const failed =
            response?.data?.fail_list ?? [];

          // ======================================================
          // All successful
          // ======================================================

          if (
            cancelled.length > 0 &&
            failed.length === 0
          ) {

            alert(
              `${cancelled.length} SPX order(s) cancelled successfully.`
            );

            this.loadRecentShipments();

            return;
          }

          // ======================================================
          // Partial success
          // ======================================================

          if (
            cancelled.length > 0 &&
            failed.length > 0
          ) {

            const failedNumbers =
              failed
                .map(
                  (item: any) =>
                    item.tracking_no
                )
                .filter(Boolean)
                .join("\n");

            alert(
              `SPX cancellation partially completed.\n\n` +
              `Successfully cancelled: ${cancelled.length}\n` +
              `Failed: ${failed.length}\n\n` +
              `Failed tracking number(s):\n${failedNumbers}`
            );

            this.loadRecentShipments();

            return;
          }

          // ======================================================
          // All failed
          // ======================================================

          if (
            cancelled.length === 0 &&
            failed.length > 0
          ) {

            const failedNumbers =
              failed
                .map(
                  (item: any) =>
                    item.tracking_no
                )
                .filter(Boolean)
                .join("\n");

            alert(
              `Failed to cancel ${failed.length} SPX order(s).\n\n` +
              `Tracking number(s):\n${failedNumbers}`
            );

            return;
          }

          // ======================================================
          // Unexpected response
          // ======================================================

          alert(
            "SPX cancellation completed, but no cancellation result was returned."
          );

        },

        error: (error: any) => {

          console.error(
            "[SPX] Cancel Order Error:",
            error
          );

          alert(
            error?.error?.message ??
            error?.message ??
            "Unable to cancel the SPX order."
          );

        }

      });

  }

}
