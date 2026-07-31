import { Component, Input, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AuthService } from '../../features/auth/services/auth.service';

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

  private authService = inject(AuthService);

  logout(): void {

    this.authService.logout();

  }

}
