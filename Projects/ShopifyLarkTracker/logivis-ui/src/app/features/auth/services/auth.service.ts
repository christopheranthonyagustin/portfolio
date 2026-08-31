import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { firstValueFrom, Observable } from 'rxjs';

import { environment } from '../../../../environments/environment';
import { AuthenticationResponse } from '../../../core/models/AuthenticationResponse';
import { User } from '../../../core/models/User';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private readonly http = inject(HttpClient);
  private readonly router = inject(Router);

  private readonly ACCESS_TOKEN_KEY = 'access_token';
  private readonly USER_ID_KEY = 'user_id';

  private readonly LARK_USER_ACCESS_TOKEN_KEY =
    'lark_user_access_token';

  private readonly LARK_USER_ACCESS_TOKEN_EXPIRES_IN_KEY =
    'lark_user_access_token_expires_in';

  private currentUser: User | null = null;

  private larkUserAccessToken: string | null = null;

  private larkRefreshTokenExpiresIn: number | null = null;


  // ==========================================================
  // INITIALIZE
  // ==========================================================

  async initialize(): Promise<void> {

    if (!this.isAuthenticated()) {
      return;
    }

    const userId =
      this.validateToken();

    console.log(
      'Angular Current User ID: ',
      userId
    );

    if (!userId) {

      this.logout({
        title:
          'Security Alert',

        message:
          'Your session appears to be invalid or has expired. Please sign in again.'
      });

      return;
    }

    try {

      await this.loadCurrentUser(
        userId
      );

    }
    catch (error: any) {

      console.error(
        'Failed to restore authenticated user.',
        error
      );

      if (error?.status === 404) {

        this.logout({
          title:
            'Account Not Found',

          message:
            'Your account could not be found. Please contact your administrator.'
        });

        return;
      }

      this.logout({
        title:
          'Unable to Load Account',

        message:
          'We could not retrieve your account information. Please try again later. If the problem persists, contact your administrator.'
      });
    }
  }


  // ==========================================================
  // EXTERNAL LOGIN
  // ==========================================================

  /**
   * Exchange OAuth token with WebApi.
   */
  externalLogin(
    token: string
  ): Observable<AuthenticationResponse> {

    return this.http.post<AuthenticationResponse>(
      `${environment.apiUrl}/auth/external-login`,
      {
        token
      }
    );
  }


  // ==========================================================
  // SESSION
  // ==========================================================

  /**
   * Persist authenticated session.
   */
  setSession(response: AuthenticationResponse): void {

    // ========================================================
    // LogiVis JWT
    // ========================================================

    if (response.token) {

      localStorage.setItem(
        this.ACCESS_TOKEN_KEY,
        response.token
      );
    }


    // ========================================================
    // LogiVis User
    // ========================================================

    if (response.user) {

      localStorage.setItem(
        this.USER_ID_KEY,
        response.user.UserId.toString()
      );

      this.currentUser =
        response.user;
    }


    // ========================================================
    // Lark User Access Token
    // ========================================================

    if (response.userAccessToken) {

      this.larkUserAccessToken =
        response.userAccessToken;

      sessionStorage.setItem(
        this.LARK_USER_ACCESS_TOKEN_KEY,
        response.userAccessToken
      );

      console.log(
        '[AUTH] Lark user access token stored:',
        {
          hasToken:
            true,

          tokenLength:
            response.userAccessToken.length
        }
      );
    }


    // ========================================================
    // Lark User Access Token Expires In
    // ========================================================
    //
    // This value comes from Lark OAuth.
    //
    // Current value:
    //
    //     7200 seconds = 2 hours
    //
    // This is the USER ACCESS TOKEN expiry.
    //
    // We are only carrying the value through the UI for now.
    // Refresh implementation comes next.
    //
    // ========================================================

    if (
      response.larkRefreshTokenExpiresIn !== undefined &&
      response.larkRefreshTokenExpiresIn !== null
    ) {

      this.larkRefreshTokenExpiresIn =
        Number(
          response.larkRefreshTokenExpiresIn
        );

      sessionStorage.setItem(
        this.LARK_USER_ACCESS_TOKEN_EXPIRES_IN_KEY,
        this.larkRefreshTokenExpiresIn.toString()
      );

      console.log(
        '[AUTH] Lark user access token expiry stored:',
        {
          expiresIn:
            this.larkRefreshTokenExpiresIn,

          expiresInHours:
            this.larkRefreshTokenExpiresIn / 3600
        }
      );
    }
  }


  // ==========================================================
  // LARK TOKEN
  // ==========================================================

  getLarkUserAccessToken(): string | null {

    if (this.larkUserAccessToken) {
      return this.larkUserAccessToken;
    }

    return sessionStorage.getItem(
      this.LARK_USER_ACCESS_TOKEN_KEY
    );
  }


  // ==========================================================
  // LARK TOKEN EXPIRY
  // ==========================================================

  getLarkRefreshTokenExpiresIn(): number | null {

    if (
      this.larkRefreshTokenExpiresIn !== null
    ) {

      return this.larkRefreshTokenExpiresIn;
    }

    const stored =
      sessionStorage.getItem(
        this.LARK_USER_ACCESS_TOKEN_EXPIRES_IN_KEY
      );

    if (!stored) {
      return null;
    }

    const value =
      Number(stored);

    if (Number.isNaN(value)) {
      return null;
    }

    this.larkRefreshTokenExpiresIn =
      value;

    return value;
  }


  // ==========================================================
  // JWT VALIDATION
  // ==========================================================

  /**
   * Validate locally stored JWT.
   * This is NOT signature validation.
   * It detects malformed or expired tokens.
   */
  private validateToken(): number | null {

    const token =
      this.getToken();

    if (!token) {
      return null;
    }

    try {

      const parts =
        token.split('.');

      if (parts.length !== 3) {
        return null;
      }

      const payload =
        JSON.parse(
          atob(parts[1])
        );

      // Expiration
      if (
        payload.exp &&
        Date.now() >= payload.exp * 1000
      ) {

        return null;
      }

      // Restore the LogiVis UserId from local storage.
      const storedUserId =
        Number(
          localStorage.getItem(
            this.USER_ID_KEY
          )
        );

      if (
        !storedUserId ||
        Number.isNaN(storedUserId)
      ) {

        return null;
      }

      return storedUserId;

    }
    catch (error) {

      console.error(
        'Invalid JWT detected.',
        error
      );

      return null;
    }
  }


  // ==========================================================
  // LOAD CURRENT USER
  // ==========================================================

  async loadCurrentUser(
    userId: number
  ): Promise<void> {

    const user =
      await firstValueFrom(
        this.http.get<User>(
          `${environment.workerDataApi}/internal/users/${userId}`
        )
      );

    console.log(
      'Angular Current User: ',
      user
    );


    // ========================================================
    // Account Status
    // ========================================================

    switch (user.Status) {

      case 'Active':
        break;

      case 'PendingApproval':

        this.logout({
          title:
            'Account Pending Approval',

          message:
            'Your account has not yet been approved by an administrator.'
        });

        return;

      case 'Suspended':

        this.logout({
          title:
            'Account Suspended',

          message:
            'Your account has been suspended by an administrator. Please contact your administrator.'
        });

        return;

      case 'Inactive':

        this.logout({
          title:
            'Account Deactivated',

          message:
            'Your account has been deactivated. Please contact your administrator.'
        });

        return;

      default:

        this.logout({
          title:
            'Access Denied',

          message:
            'Your account is not authorized to access LogiVis.'
        });

        return;
    }


    // ========================================================
    // Super User bypass
    // ========================================================

    const isSuperUser =
      user.IsSuperUser ||
      user.UserId === 1;


    // ========================================================
    // Authorization
    // ========================================================

    if (
      !isSuperUser &&
      (
        !user.Permissions ||
        user.Permissions.length === 0
      )
    ) {

      this.logout({
        title:
          'Access Revoked',

        message:
          'Your account does not have permission to access LogiVis. Please contact your administrator.'
      });

      return;
    }


    // ========================================================
    // Persist User ID
    // ========================================================

    localStorage.setItem(
      this.USER_ID_KEY,
      user.UserId.toString()
    );


    // ========================================================
    // Keep complete authenticated user in memory
    // ========================================================

    this.setCurrentUser(
      user
    );
  }


  // ==========================================================
  // CURRENT USER
  // ==========================================================

  getCurrentUser(): User | null {
    return this.currentUser;
  }


  setCurrentUser(
    user: User
  ): void {

    this.currentUser =
      user;
  }


  // ==========================================================
  // TOKENS
  // ==========================================================

  getToken(): string | null {

    return localStorage.getItem(
      this.ACCESS_TOKEN_KEY
    );
  }


  // ==========================================================
  // USER ID
  // ==========================================================

  getUserId(): number | null {

    const userId =
      localStorage.getItem(
        this.USER_ID_KEY
      );

    return userId
      ? Number(userId)
      : null;
  }


  // ==========================================================
  // AUTHENTICATION
  // ==========================================================

  isAuthenticated(): boolean {

    return !!this.getToken();
  }


  hasAccess(): boolean {

    const user =
      this.currentUser;

    if (!user) {
      return false;
    }

    if (
      user.IsSuperUser ||
      user.UserId === 1
    ) {

      return true;
    }

    return !!user.Permissions &&
      user.Permissions.length > 0;
  }


  // ==========================================================
  // CLEAR TOKEN
  // ==========================================================

  clearToken(): void {

    localStorage.removeItem(
      this.ACCESS_TOKEN_KEY
    );
  }


  // ==========================================================
  // LOGOUT
  // ==========================================================

  logout(
    notification?: {
      title: string;
      message: string;
    }
  ): void {

    this.currentUser =
      null;

    this.larkUserAccessToken =
      null;

    this.larkRefreshTokenExpiresIn =
      null;

    localStorage.removeItem(
      this.ACCESS_TOKEN_KEY
    );

    localStorage.removeItem(
      this.USER_ID_KEY
    );

    sessionStorage.removeItem(
      this.LARK_USER_ACCESS_TOKEN_KEY
    );

    sessionStorage.removeItem(
      this.LARK_USER_ACCESS_TOKEN_EXPIRES_IN_KEY
    );

    void this.router.navigate(
      ['/login'],
      notification
        ? {
          state: {
            notification
          }
        }
        : undefined
    );
  }
}
