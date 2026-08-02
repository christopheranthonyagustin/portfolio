import { Component, Input, inject } from '@angular/core';
import { CommonModule } from '@angular/common';

import { AuthService } from '../../features/auth/services/auth.service';
import { User } from '../../core/models/User';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './header.component.html',
  styleUrl: './header.component.scss'
})
export class HeaderComponent {

  @Input() title = 'Dashboard';

  @Input() subtitle = 'Overview';

  private readonly authService = inject(AuthService);

  get currentUser(): User | null {
    return this.authService.getCurrentUser();
  }

  logout(): void {
    this.authService.logout();
  }

}
