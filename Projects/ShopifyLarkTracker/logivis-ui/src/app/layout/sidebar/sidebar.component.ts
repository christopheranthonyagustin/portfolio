import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink, RouterLinkActive } from '@angular/router';

import { AuthService } from '../../features/auth/services/auth.service';
import { PermissionService } from '../../features/auth/services/permission';

import { User } from '../../core/models/User';

@Component({
  selector: 'app-sidebar',
  standalone: true,
  imports: [
    CommonModule,
    RouterLink,
    RouterLinkActive
  ],
  templateUrl: './sidebar.component.html',
  styleUrl: './sidebar.component.scss'
})
export class SidebarComponent {

  constructor(
    private readonly authService: AuthService,
    public readonly permissionService: PermissionService
  ) { }

  collapsed = signal(false);

  get currentUser(): User | null {
    return this.authService.getCurrentUser();
  }

  get userInitials(): string {

    const user = this.currentUser;

    if (!user) {
      return '?';
    }

    const first = user.FirstName?.trim().charAt(0).toUpperCase() ?? '';
    const last = user.LastName?.trim().charAt(0).toUpperCase() ?? '';

    return `${first}${last}`;

  }

  get displayRole(): string {

    const user = this.currentUser;

    if (!user) {
      return '';
    }

    return user.IsSuperUser
      ? 'Super Admin'
      : user.Role?.Name ?? '';

  }

  get isSuperUser(): boolean {
    return this.currentUser?.IsSuperUser ?? false;
  }

  toggleSidebar(): void {
    this.collapsed.update(v => !v);
  }

}
