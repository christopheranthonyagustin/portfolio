import { Component, signal } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterLink, RouterLinkActive } from '@angular/router';

import { AuthService } from '../../features/auth/services/auth.service';
import { User } from '../../core/models/User';

@Component({
  selector: 'app-footer',
  standalone: true,
  templateUrl: './footer.component.html',
  styleUrl: './footer.component.scss'
})
export class FooterComponent {

  constructor(
    private readonly authService: AuthService
  ) { }

  collapsed = signal(false);

  get currentUser(): User | null {
    return this.authService.getCurrentUser();
  }

  get companyInitials(): string {

    const company = this.currentUser?.CompanyName;

    if (!company) {
      return '?';
    }

    const words = company
      .split(' ')
      .filter(word => word.length > 0);

    if (words.length === 1) {
      return words[0].substring(0, 2).toUpperCase();
    }

    return (words[0][0] + words[1][0]).toUpperCase();

  }



}
