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

    const larkUserAccessToken =
      params['larkUserAccessToken'];

    const larkExpiresIn =
      params['larkRefreshTokenExpiresIn'];

    const error =
      params['error'];

    const errorDescription =
      params['error_description'];

    const errorCode =
      params['error_code'];


    // ==========================================================
    // DEBUG AUTHENTICATION PARAMETERS
    // ==========================================================

    console.log(
      '[AUTH] Callback received:',
      {
        hasLogiVisToken:
          !!token,

        logiVisTokenLength:
          token?.length ?? 0,

        userId,

        hasLarkUserAccessToken:
          !!larkUserAccessToken,

        larkUserAccessTokenLength:
          larkUserAccessToken?.length ?? 0,

        larkExpiresIn,

        larkExpiresInSeconds:
          larkExpiresIn
            ? Number(larkExpiresIn)
            : null,

        error,
        errorCode
      }
    );


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
              title:
                this.translate.instant(
                  'auth.authorizationCancelled.title'
                ),

              message:
                this.translate.instant(
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
              title:
                this.translate.instant(
                  'auth.authenticationFailed.title'
                ),

              message:
                this.translate.instant(
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

      console.error(
        '[AUTH] Authentication callback did not contain a LogiVis JWT.'
      );

      await this.router.navigate(
        ['/login'],
        {
          state: {
            notification: {
              title:
                this.translate.instant(
                  'auth.invalidAuthentication.title'
                ),

              message:
                this.translate.instant(
                  'auth.invalidAuthentication.message'
                )
            }
          }
        }
      );

      return;
    }


    // ==========================================================
    // Save LogiVis JWT
    // ==========================================================

    localStorage.setItem(
      'access_token',
      token
    );


    // ==========================================================
    // Save Lark User Access Token
    // ==========================================================
    //
    // This is the Lark OAuth user token.
    //
    // It is intentionally separate from:
    //
    //     access_token
    //
    // which is the LogiVis JWT.
    //
    // Dashboard will read this value and pass it to:
    //
    //     widget.larkToken
    //
    // ==========================================================

    if (larkUserAccessToken) {

      sessionStorage.setItem(
        'lark_user_access_token',
        larkUserAccessToken
      );

      console.log(
        '[AUTH] Lark user access token stored.',
        {
          hasToken:
            true,

          tokenLength:
            larkUserAccessToken.length
        }
      );

    }
    else {

      console.warn(
        '[AUTH] No Lark user access token received.'
      );

      sessionStorage.removeItem(
        'lark_user_access_token'
      );
    }


    // ==========================================================
    // Save Lark User Access Token Expiry
    // ==========================================================
    //
    // This is the Lark USER ACCESS TOKEN lifetime.
    //
    // Current Lark value:
    //
    //     7200 seconds = 2 hours
    //
    // This is NOT the refresh-token lifetime.
    //
    // ==========================================================

    if (
      larkExpiresIn &&
      !Number.isNaN(Number(larkExpiresIn))
    ) {

      sessionStorage.setItem(
        'lark_user_access_token_expires_in',
        larkExpiresIn
      );

      console.log(
        '[AUTH] Lark user access token expiry stored.',
        {
          expiresIn:
            Number(larkExpiresIn),

          expiresInHours:
            Number(larkExpiresIn) / 3600
        }
      );

    }
    else {

      console.warn(
        '[AUTH] No Lark user access token expiry received.'
      );

      sessionStorage.removeItem(
        'lark_user_access_token_expires_in'
      );
    }


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


      if (!currentUser) {

        console.error(
          '[AUTH] Current user could not be loaded.'
        );

        return;
      }


      // ========================================================
      // Verify Authentication State Before Dashboard
      // ========================================================

      console.log(
        '[AUTH] Authentication state ready.',
        {
          userId:
            currentUser.UserId,

          displayName:
            currentUser.DisplayName,

          providerUserId:
            currentUser.ProviderUserId,

          hasLogiVisToken:
            !!localStorage.getItem(
              'access_token'
            ),

          hasLarkUserAccessToken:
            !!sessionStorage.getItem(
              'lark_user_access_token'
            ),

          larkUserAccessTokenLength:
            sessionStorage.getItem(
              'lark_user_access_token'
            )?.length ?? 0,

          larkExpiresIn:
            sessionStorage.getItem(
              'lark_user_access_token_expires_in'
            )
        }
      );


      // ========================================================
      // Welcome
      // ========================================================

      await this.router.navigate(
        ['/dashboard'],
        {
          state: {
            notification: {

              title:
                this.translate.instant(
                  'auth.welcome.title'
                ),

              message:
                this.translate.instant(
                  'auth.welcome.message',
                  {
                    name:
                      currentUser.DisplayName
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

                title:
                  this.translate.instant(
                    'auth.accountNotFound.title'
                  ),

                message:
                  this.translate.instant(
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

              title:
                this.translate.instant(
                  'auth.unableToLoadAccount.title'
                ),

              message:
                this.translate.instant(
                  'auth.unableToLoadAccount.message'
                )
            }
          }
        }
      );
    }
  }
}
