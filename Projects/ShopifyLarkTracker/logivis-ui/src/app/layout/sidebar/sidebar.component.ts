import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink, RouterLinkActive } from '@angular/router';
import {
  TranslateService,
  TranslatePipe
} from '@ngx-translate/core';

import { AuthService } from '../../features/auth/services/auth.service';
import { PermissionService } from '../../features/auth/services/permission';
import { User } from '../../core/models/User';
import { SidebarService } from './sidebar.service';

@Component({
  selector: 'app-sidebar',
  standalone: true,
  imports: [
    CommonModule,
    RouterLink,
    RouterLinkActive,
    TranslatePipe
  ],
  templateUrl: './sidebar.component.html',
  styleUrl: './sidebar.component.scss'
})
export class SidebarComponent {

  private readonly mobileBreakpoint = 768;

  constructor(
    private readonly authService: AuthService,
    public readonly permissionService: PermissionService,
    public readonly sidebarService: SidebarService,
    private readonly translate: TranslateService
  ) {

    // ==========================================================
    // Restore Language
    // ==========================================================

    const savedLanguage =
      localStorage.getItem('logivis-language');

    const language =
      savedLanguage === 'zh'
        ? 'zh'
        : 'en';

    this.translate.use(language);
  }


  get currentUser(): User | null {
    return this.authService.getCurrentUser();
  }


  get userInitials(): string {

    const user = this.currentUser;

    if (!user) {
      return '?';
    }

    const first =
      user.FirstName?.trim().charAt(0).toUpperCase() ?? '';

    const last =
      user.LastName?.trim().charAt(0).toUpperCase() ?? '';

    return `${first}${last}`;
  }


  get displayRole(): string {

    const user = this.currentUser;

    if (!user) {
      return '';
    }

    if (user.IsSuperUser) {
      return 'sidebar.roles.superAdmin';
    }

    switch (user.Role?.Code?.toUpperCase()) {

      case 'ADMIN':
        return 'sidebar.roles.administrator';

      case 'MANAGER':
        return 'sidebar.roles.operationsManager';

      case 'OPERATOR':
        return 'sidebar.roles.operator';

      case 'VIEWER':
        return 'sidebar.roles.viewer';

      case '3PL':
        return 'sidebar.roles.3plUser';

      default:
        return user.Role?.Name ?? '';
    }
  }


  get isSuperUser(): boolean {
    return this.currentUser?.IsSuperUser ?? false;
  }


  toggleSidebar(): void {

    console.log(
      'Before:',
      this.sidebarService.collapsed()
    );

    this.sidebarService.toggle();

    console.log(
      'After:',
      this.sidebarService.collapsed()
    );
  }


  private updateSidebarState(): void {

    if (window.innerWidth <= this.mobileBreakpoint) {

      this.sidebarService.collapse();

    } else {

      this.sidebarService.expand();

    }
  }

}
