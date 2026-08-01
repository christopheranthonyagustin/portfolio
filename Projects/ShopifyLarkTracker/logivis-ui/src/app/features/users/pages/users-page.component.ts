import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AgGridAngular } from 'ag-grid-angular';


import {
  ColDef,
  GridApi,
  GridReadyEvent
} from 'ag-grid-community';

import { SidebarComponent } from '../../../layout/sidebar/sidebar.component';
import { HeaderComponent } from '../../../layout/header/header.component';
import { FooterComponent } from '../../../layout/footer/footer.component';
import { SidebarService } from '../../../layout/sidebar/sidebar.service';

@Component({
  selector: 'app-users-page',
  standalone: true,
  imports: [
    CommonModule,
    AgGridAngular,
    SidebarComponent,
    HeaderComponent,
    FooterComponent
  ],
  templateUrl: './users-page.component.html'
})
export class UsersPageComponent {

  constructor(
    public readonly sidebarService: SidebarService
  ) { }

  private gridApi!: GridApi;
  users: any[] = [];
  totalUsers = 0;

  activeCount = 0;
  pendingCount = 0;
  suspendedCount = 0;
  rejectedCount = 0;

  columnDefs: ColDef[] = [
    {
      headerName: 'Name',
      field: 'displayName',
      flex: 2
    },
    {
      headerName: 'Email',
      field: 'email',
      flex: 2
    },
    {
      headerName: 'Company',
      field: 'companyName',
      flex: 2
    },
    {
      headerName: 'Status',
      field: 'status',
      width: 140
    },
    {
      headerName: 'Last Login',
      field: 'lastLogin',
      width: 180
    },
    {
      headerName: 'Action',
      width: 120,
      cellRenderer: () => '<button>View</button>'
    }
  ];

  defaultColDef: ColDef = {
    sortable: true,
    filter: true,
    resizable: true
  };

  onGridReady(event: GridReadyEvent): void {

    console.log('Grid Ready');
    this.gridApi = event.api;

    this.loadUsers();

  }

  private loadUsers(): void {

    console.log('Loading users');

    this.users = [
      {
        displayName: 'Christopher Anthony',
        email: 'anthony@gmail.com',
        companyName: 'LogiVis',
        status: 'Active',
        lastLogin: '22 Jul 2026'
      }
    ];

    this.gridApi.setGridOption('rowData', this.users);

    console.log('RowData:', this.gridApi.getGridOption('rowData'));
    console.log('Displayed:', this.gridApi.getDisplayedRowCount());
    console.log('Columns:', this.gridApi.getColumns()?.length);

    this.totalUsers = this.users.length;
    this.activeCount = 1;
    this.pendingCount = 0;
    this.suspendedCount = 0;
    this.rejectedCount = 0;

  }

  inviteUser(): void {

    console.log('Invite User');

  }

}
