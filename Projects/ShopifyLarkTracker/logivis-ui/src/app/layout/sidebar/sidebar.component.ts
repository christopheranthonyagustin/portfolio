import { Component, HostListener } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink, RouterLinkActive } from '@angular/router';

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
    RouterLinkActive
  ],
  templateUrl: './sidebar.component.html',
  styleUrl: './sidebar.component.scss'
})
export class SidebarComponent {

  private readonly mobileBreakpoint = 768;

  constructor(
    private readonly authService: AuthService,
    public readonly permissionService: PermissionService,
    public readonly sidebarService: SidebarService
  ) {
    //this.updateSidebarState();
  }

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

    console.log('Before:', this.sidebarService.collapsed());

    this.sidebarService.toggle();

    console.log('After:', this.sidebarService.collapsed());

  }

  // @HostListener('window:resize')
  // onResize(): void {
  //   this.updateSidebarState();
  // }

  private updateSidebarState(): void {

    if (window.innerWidth <= this.mobileBreakpoint) {

      // Always start collapsed on mobile
      this.sidebarService.collapse();

    } else {

      // Always start expanded on desktop
      this.sidebarService.expand();

    }

  }

}
