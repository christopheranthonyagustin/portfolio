import {
  Component,
  ViewChild,
  ElementRef,
  ChangeDetectorRef,
  inject
} from '@angular/core';

import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

import { Companies } from '../../../../core/models/Companies';
import { Role } from '../../../../core/models/Role';
import { AuthService } from '../../../auth/services/auth.service';
import { User } from '../../../../core/models/User';
import { HttpClient } from '@angular/common/http';
import { environment } from '../../../../../environments/environment';

@Component({
  selector: 'app-user-edit-dialog',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule
  ],
  templateUrl: './user-edit-dialog.component.html',
  styleUrl: './user-edit-dialog.component.scss'
})
export class UserEditDialogComponent {

  constructor(
    private readonly cdr: ChangeDetectorRef
  ) { }

  private readonly authService = inject(AuthService);
  private readonly http = inject(HttpClient);

  private readonly NO_CHILD_COMPANY_ID = 0;

  @ViewChild('dialog')
  dialog!: ElementRef<HTMLDialogElement>;

  user: any = null;

  parentCompanyId = 0;
  companyId = 0;
  roleId = 0;
  status = '';

  parentCompanies: Companies[] = [];

  // Master list (never changes)
  allCompanies: Companies[] = [];

  // Display list
  companies: Companies[] = [];

  roles: Role[] = [];

  statuses = [
    'PendingApproval',
    'Active',
    'Inactive'
  ];

  get currentUser(): User | null {

    return this.authService.getCurrentUser();

  }

  get currentCompanies(): Companies[] {

    return this.currentUser?.Companies ?? [];

  }

  open(user: any): void {

    this.user = user;

    this.roleId = user.RoleId;
    this.status = user.Status;

    // Parent Company is always fixed
    this.parentCompanyId = this.currentUser!.CompanyId;

    if (this.currentUser!.IsSuperUser || this.currentUser!.UserId === 1) {

      // Super User
      this.parentCompanyId = user.ParentCompanyId ?? user.CompanyId;

      this.loadParentCompanies();
      this.loadChildCompanies(this.parentCompanyId);

    }
    else {

      // Administrator
      this.parentCompanyId = this.currentUser!.CompanyId;

      this.parentCompanies = [
        {
          CompanyId: this.currentUser!.CompanyId,
          Name: this.currentUser!.CompanyName
        }
      ];

      this.companies = [
        {
          CompanyId: this.NO_CHILD_COMPANY_ID,
          Name: '---'
        },
        ...this.currentCompanies
      ];

    }

    this.roles = [
      {
        RoleId: 2,
        Name: 'Administrator',
        Description: null,
        Code: 'ADMIN',
        Status: 'Active',
        CreatedAt: '',
        CreatedByUserId: null,
        UpdatedAt: null,
        UpdatedByUserId: null
      },
      {
        RoleId: 4,
        Name: 'Operator',
        Description: null,
        Code: 'OPERATOR',
        Status: 'Active',
        CreatedAt: '',
        CreatedByUserId: null,
        UpdatedAt: null,
        UpdatedByUserId: null
      },
      {
        RoleId: 5,
        Name: 'Viewer',
        Description: null,
        Code: 'VIEWER',
        Status: 'Active',
        CreatedAt: '',
        CreatedByUserId: null,
        UpdatedAt: null,
        UpdatedByUserId: null
      }
    ];

    // Administrator assigned to parent company
    if (
      user.RoleId === 2 &&
      user.CompanyId === this.currentUser!.CompanyId
    ) {

      this.companyId = this.NO_CHILD_COMPANY_ID;

    }
    else {

      this.companyId = user.CompanyId;

    }

    // Apply role/company logic
    this.onRoleChanged();

    this.cdr.detectChanges();

    this.dialog.nativeElement.showModal();

  }

  loadParentCompanies(): void {

    this.http
      .get<Companies[]>(
        `${environment.workerDataApi}/internal/companies/parents`
      )
      .subscribe({

        next: (companies: Companies[]) => {

          this.parentCompanies = companies;

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

          this.companies = [
            {
              CompanyId: this.NO_CHILD_COMPANY_ID,
              Name: '---'
            },
            ...companies
          ];

        },

        error: (error: any) => {

          console.error(error);

        }

      });

  }

  onParentCompanyChanged(): void {

    if (this.currentUser!.IsSuperUser || this.currentUser!.UserId === 1) {

      this.loadChildCompanies(this.parentCompanyId);

      this.companyId = this.NO_CHILD_COMPANY_ID;

    }

  }

  onRoleChanged(): void {

    // Parent Company always stays S1
    this.parentCompanyId = this.currentUser!.CompanyId;

    // Administrator
    if (this.roleId === 2) {

      this.companies = [
        {
          CompanyId: this.NO_CHILD_COMPANY_ID,
          Name: '---'
        }
      ];

      this.companyId = this.NO_CHILD_COMPANY_ID;

      return;

    }

    // Operator / Viewer
    this.companies = [...this.currentCompanies];

    if (
      this.companyId === this.NO_CHILD_COMPANY_ID ||
      !this.companies.some(c => c.CompanyId === this.companyId)
    ) {

      this.companyId = this.companies[0]?.CompanyId ?? 0;

    }

  }

  close(): void {

    this.dialog.nativeElement.close();

  }

  save(): void {

    const companyId =
      this.companyId === this.NO_CHILD_COMPANY_ID
        ? this.parentCompanyId
        : this.companyId;

    this.http.put(
      `${environment.workerDataApi}/internal/user-management/users`,
      {
        UserId: this.user.UserId,
        CompanyId: companyId,
        RoleId: this.roleId,
        Status: this.status
      }
    ).subscribe({

      next: () => {

        console.log('User updated.');

        this.close();

      },

      error: error => {

        console.error(error);

        alert('Failed to update user.');

      }

    });

  }

}
