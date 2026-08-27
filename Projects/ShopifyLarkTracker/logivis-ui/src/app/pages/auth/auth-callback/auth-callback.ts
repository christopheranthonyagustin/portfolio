import { Component, OnInit, inject } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { firstValueFrom } from 'rxjs';

import {
  TranslateService,
  TranslatePipe
} from '@ngx-translate/core';

import { AuthService } from '../../../features/auth/services/auth.service';

@Component({
  selector: 'app-auth-callback',
  standalone: true,
  imports: [
    TranslatePipe
  ],
  templateUrl: './auth-callback.component.html',
  styleUrl: './auth-callback.component.scss'
})
export class AuthCallbackComponent implements OnInit {

  private readonly route =
    inject(ActivatedRoute);

  private readonly router =
    inject(Router);

  private readonly authService =
    inject(AuthService);

  private readonly translate =
    inject(TranslateService);


  async ngOnInit(): Promise<void> {

    // ==========================================================
    // Restore Saved Language
    // ==========================================================

    const savedLanguage =
      localStorage.getItem('logivis-language');

    const language: 'en' | 'zh' =
      savedLanguage === 'zh'
        ? 'zh'
        : 'en';

    await firstValueFrom(
      this.translate.use(language)
    );


    // ==========================================================
    // Authentication Parameters
    // ==========================================================

    const params =
      await firstValueFrom(
        this.route.queryParams
      );

    const token =
      params['token'];

    const userId =
      Number(params['userId']);

    const error =
      params['error'];

    const errorDescription =
      params['error_description'];

    const errorCode =
      params['error_code'];


    // ==========================================================
    // Authorization Cancelled / Rejected
    // ==========================================================

    if (
      error === 'access_denied' ||
      error === 'authorization_denied' ||
      error === 'user_denied' ||
      errorCode === 'access_denied'
    ) {

      console.log(
        '[AUTH] User cancelled or rejected authorization.',
        {
          error,
          errorCode,
          errorDescription
        }
      );

      await this.router.navigate(
        ['/login'],
        {
          state: {
            notification: {
              title: this.translate.instant(
                'auth.authorizationCancelled.title'
              ),
              message: this.translate.instant(
                'auth.authorizationCancelled.message'
              )
            }
          }
        }
      );

      return;
    }


    // ==========================================================
    // Other Authentication Error
    // ==========================================================

    if (error) {

      console.error(
        '[AUTH] Authentication error:',
        {
          error,
          errorCode,
          errorDescription
        }
      );

      await this.router.navigate(
        ['/login'],
        {
          state: {
            notification: {
              title: this.translate.instant(
                'auth.authenticationFailed.title'
              ),
              message: this.translate.instant(
                'auth.authenticationFailed.message'
              )
            }
          }
        }
      );

      return;
    }


    // ==========================================================
    // Invalid Authentication
    // ==========================================================

    if (!token) {

      await this.router.navigate(
        ['/login'],
        {
          state: {
            notification: {
              title: this.translate.instant(
                'auth.invalidAuthentication.title'
              ),
              message: this.translate.instant(
                'auth.invalidAuthentication.message'
              )
            }
          }
        }
      );

      return;
    }


    // ==========================================================
    // Save Access Token
    // ==========================================================

    localStorage.setItem(
      'access_token',
      token
    );


    // ==========================================================
    // Load Current User
    // ==========================================================

    try {

      if (userId > 0) {

        await this.authService.loadCurrentUser(
          userId
        );

      }

      const currentUser =
        this.authService.getCurrentUser();

      // AuthService already redirected
      // if authorization failed.

      if (!currentUser) {
        return;
      }


      // ========================================================
      // Welcome
      // ========================================================

      await this.router.navigate(
        ['/dashboard'],
        {
          state: {
            notification: {
              title: this.translate.instant(
                'auth.welcome.title'
              ),
              message: this.translate.instant(
                'auth.welcome.message',
                {
                  name: currentUser.DisplayName
                }
              )
            }
          }
        }
      );

    }
    catch (err: any) {

      console.error(
        'Failed to load current user.',
        err
      );


      // ========================================================
      // Account Not Found
      // ========================================================

      if (err?.status === 404) {

        await this.router.navigate(
          ['/login'],
          {
            state: {
              notification: {
                title: this.translate.instant(
                  'auth.accountNotFound.title'
                ),
                message: this.translate.instant(
                  'auth.accountNotFound.message'
                )
              }
            }
          }
        );

        return;
      }


      // ========================================================
      // Unable to Load Account
      // ========================================================

      await this.router.navigate(
        ['/login'],
        {
          state: {
            notification: {
              title: this.translate.instant(
                'auth.unableToLoadAccount.title'
              ),
              message: this.translate.instant(
                'auth.unableToLoadAccount.message'
              )
            }
          }
        }
      );

    }

  }

}
