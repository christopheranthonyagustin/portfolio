import { Component, Input, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import {
  TranslatePipe,
  TranslateService
} from '@ngx-translate/core';

import { AuthService } from '../../features/auth/services/auth.service';
import { User } from '../../core/models/User';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [
    CommonModule,
    TranslatePipe
  ],
  templateUrl: './header.component.html',
  styleUrl: './header.component.scss'
})
export class HeaderComponent {

  @Input() title = 'header.dashboard.title';

  @Input() subtitle = 'header.dashboard.subtitle';

  private readonly authService = inject(AuthService);
  private readonly translate = inject(TranslateService);

  get currentUser(): User | null {
    return this.authService.getCurrentUser();
  }

  get translatedTitle(): string {
    return this.translate.instant(this.title);
  }

  get translatedSubtitle(): string {
    return this.translate.instant(this.subtitle);
  }

  logout(): void {
    this.authService.logout();
  }

}
