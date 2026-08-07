import {
  Component,
  OnInit,
  inject,
  ChangeDetectorRef
} from '@angular/core';

import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { HttpClient } from '@angular/common/http';

import { AgGridAngular } from 'ag-grid-angular';
import {
  ColDef,
  GridApi,
  GridReadyEvent
} from 'ag-grid-community';

import { environment } from '../../../../environments/environment';

import { AuthService } from '../../auth/services/auth.service';
import { User } from '../../../core/models/User';
import { Companies } from '../../../core/models/Companies';

import { SidebarComponent } from '../../../layout/sidebar/sidebar.component';
import { HeaderComponent } from '../../../layout/header/header.component';
import { FooterComponent } from '../../../layout/footer/footer.component';
import { SidebarService } from '../../../layout/sidebar/sidebar.service';
import { ViewChild } from '@angular/core';
import { UserActionRendererComponent } from '../../../features/users/components/user-action-renderer/user-action-renderer.component';
import { UserEditDialogComponent } from '../../../features/users/components/user-edit-dialog/user-edit-dialog.component';
import { NgZone } from '@angular/core';

@Component({
  selector: 'app-users-page',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    AgGridAngular,
    SidebarComponent,
    HeaderComponent,
    FooterComponent,
    UserActionRendererComponent,
    UserEditDialogComponent
  ],
  templateUrl: './users-page.component.html',
  styleUrl: './users-page.component.scss'
})
export class UsersPageComponent implements OnInit {

  components = {
    userActionRenderer: UserActionRendererComponent
  };

  @ViewChild(UserEditDialogComponent)
  private userEditDialog!: UserEditDialogComponent;

  private readonly cdr = inject(ChangeDetectorRef);
  private readonly ngZone = inject(NgZone);

  constructor(
    public readonly sidebarService: SidebarService
  ) { }

  private readonly authService = inject(AuthService);
  private readonly http = inject(HttpClient);

  private gridApi!: GridApi;

  activeCompanyId = 0;
  parentCompanyId = 0;
  companyOptions: Companies[] = [];

  users: any[] = [];

  totalUsers = 0;
  pendingApprovalCount = 0;
  activeCount = 0;
  inactiveCount = 0;

  parentCompanies: Companies[] = [];

  columnDefs: ColDef[] = [
    {
      headerName: 'Name',
      field: 'DisplayName',
      flex: 2.5,
      minWidth: 240
    },
    {
      headerName: 'Email',
      field: 'Email',
      flex: 2.5,
      minWidth: 260
    },
    {
      headerName: 'Company',
      field: 'CompanyName',
      flex: 2,
      minWidth: 220
    },
    {
      headerName: 'Role',
      field: 'RoleName',
      width: 170
    },
    {
      headerName: 'Identity Provider',
      field: 'IdentityProvider',
      width: 160
    },
    {
      headerName: 'Status',
      field: 'Status',
      width: 150
    },
    {
      headerName: 'Last Login',
      field: 'LastLoginAt',
      width: 180
    },
    {
      headerName: 'Action',
      width: 120,
      cellRenderer: UserActionRendererComponent,
      cellRendererParams: {
        onEdit: (user: any) => this.editUser(user)
      }
    }
  ];

  defaultColDef: ColDef = {
    sortable: true,
    filter: true,
    resizable: true
  };

  ngOnInit(): void {

    if (!this.currentUser) {
      return;
    }

    // Default Parent Company
    this.parentCompanyId = this.currentUser.CompanyId;

    // Super User
    if (this.isSuperUser) {

      // Prevent company_id=0 during the initial load
      this.activeCompanyId = this.currentUser.CompanyId;

      // Load all parent companies from the API
      this.loadParentCompanies();

      return;

    }

    // Administrator / Operator / Viewer
    this.companyOptions = [
      {
        CompanyId: 0,
        Name: '---'
      },
      ...this.companies
    ];

    this.activeCompanyId = 0;

  }

  onGridReady(event: GridReadyEvent): void {

    this.gridApi = event.api;

    this.loadUsers();

  }

  onCompanyChanged(): void {

    if (!this.gridApi) {
      return;
    }

    if (this.isSuperUser) {

      this.loadUsers();

      return;

    }

    // Company = ---
    if (this.activeCompanyId === 0) {

      this.parentCompanyId = this.currentUser!.CompanyId;

    }
    else {

      this.parentCompanyId = 0;

    }

    this.loadUsers();

  }

  onParentCompanyChanged(): void {

    if (!this.isSuperUser) {
      return;
    }

    this.loadChildCompanies(this.parentCompanyId);

  }

  editUser(user: any): void {

    console.log('ViewChild Instance', this.userEditDialog);

    this.userEditDialog.open(user);

  }

  loadParentCompanies(): void {

    this.http
      .get<Companies[]>(
        `${environment.workerDataApi}/internal/companies/parents`
      )
      .subscribe({

        next: (companies: Companies[]) => {

          this.parentCompanies = companies;

          // Default Parent Company = current user's company
          this.parentCompanyId = this.currentUser!.CompanyId;

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
              CompanyId: 0,
              Name: '---'
            },
            ...companies
          ];

          this.activeCompanyId = 0;

          if (this.gridApi) {
            this.loadUsers();
          }

        },

        error: (error: any) => {

          console.error(error);

        }

      });

  }

  private loadUsers(): void {

    const companyId =
      this.activeCompanyId === 0
        ? this.parentCompanyId
        : this.activeCompanyId;

    this.http
      .get<any[]>(
        `${environment.workerDataApi}/internal/user-management/users?company_id=${companyId}`
      )
      .subscribe({

        next: users => {

          this.users = users;

          this.gridApi.setGridOption(
            'rowData',
            users
          );

          this.totalUsers = users.length;

          this.pendingApprovalCount =
            users.filter(x => x.Status === 'PendingApproval').length;

          this.activeCount =
            users.filter(x => x.Status === 'Active').length;

          this.inactiveCount =
            users.filter(x => x.Status === 'Inactive').length;

        },

        error: error => {

          console.error(error);

        }

      });

  }

  inviteUser(): void {

    console.log('Invite User');

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

}
