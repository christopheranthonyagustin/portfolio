import { Component, OnInit, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { environment } from '../../../../../environments/environment';

import {
  TranslateService,
  TranslatePipe
} from '@ngx-translate/core';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [
    CommonModule,
    TranslatePipe
  ],
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})
export class LoginComponent implements OnInit {

  private readonly translate =
    inject(TranslateService);

  version = '1.0.0';

  showAlert = false;
  authTitle = '';
  authError = '';
  authCode = '';

  language: 'en' | 'zh' = 'en';

  ngOnInit(): void {

    // ==========================================================
    // Language
    // ==========================================================

    const savedLanguage =
      localStorage.getItem('logivis-language');

    if (
      savedLanguage === 'en' ||
      savedLanguage === 'zh'
    ) {
      this.language = savedLanguage;
    }

    this.translate.use(this.language);


    // ==========================================================
    // Authentication Notification
    // ==========================================================

    const notification =
      history.state?.notification;

    if (!notification) {
      return;
    }

    this.showAlert = true;
    this.authTitle = notification.title;
    this.authError = notification.message;
  }


  // ==========================================================
  // Language
  // ==========================================================

  public switchLanguage(
    language: 'en' | 'zh'
  ): void {

    this.language = language;

    localStorage.setItem(
      'logivis-language',
      language
    );

    this.translate.use(language);
  }


  // ==========================================================
  // Authentication
  // ==========================================================

  loginWithLark(): void {

    const url =
      `${environment.apiUrl}/auth/lark/login` +
      `?frontend=${encodeURIComponent(window.location.origin)}` +
      `&language=${encodeURIComponent(this.language)}`;

    console.log('[AUTH] Lark Login:', url);

    window.location.href = url;
  }


  loginWithGoogle(): void {

    const url =
      `${environment.apiUrl}/auth/google/login` +
      `?frontend=${encodeURIComponent(window.location.origin)}` +
      `&language=${encodeURIComponent(this.language)}`;

    console.log('[AUTH] Google Login:', url);

    window.location.href = url;
  }


  // ==========================================================
  // Alert
  // ==========================================================

  closeAlert(): void {
    this.showAlert = false;
  }

}
