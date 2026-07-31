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

  private currentUser: User | null = null;

  async initialize(): Promise<void> {

    if (!this.isAuthenticated()) {
      return;
    }

    const userId = this.validateToken();

    console.log('Current User: ', userId);

    if (!userId) {

      this.logout({
        title: 'Security Alert',
        message: 'Your session appears to be invalid or has expired. Please sign in again.'
      });

      return;

    }

    try {

      await this.loadCurrentUser(userId);

    }
    catch (error: any) {

      console.error('Failed to restore authenticated user.', error);

      if (error?.status === 404) {

        this.logout({
          title: 'Account Not Found',
          message: 'Your account could not be found. Please contact your administrator.'
        });

        return;

      }

      this.logout({
        title: 'Unable to Load Account',
        message: 'We could not retrieve your account information. Please try again later. If the problem persists, contact your administrator.'
      });

    }

  }

  /**
   * Exchange OAuth token with WebApi.
   */
  externalLogin(token: string): Observable<AuthenticationResponse> {

    return this.http.post<AuthenticationResponse>(
      `${environment.apiUrl}/auth/external-login`,
      { token }
    );

  }

  /**
   * Persist authenticated session.
   */
  setSession(response: AuthenticationResponse): void {

    if (response.token) {
      localStorage.setItem(this.ACCESS_TOKEN_KEY, response.token);
    }

    if (response.user) {
      localStorage.setItem(this.USER_ID_KEY, response.user.UserId.toString());
    }

  }

  /**
   * Validate locally stored JWT.
   * This is NOT signature validation.
   * It detects malformed or expired tokens.
   */
  private validateToken(): number | null {

    const token = this.getToken();

    if (!token) {
      return null;
    }

    try {

      const parts = token.split('.');

      if (parts.length !== 3) {
        return null;
      }

      const payload = JSON.parse(atob(parts[1]));

      // Expiration
      if (payload.exp && Date.now() >= payload.exp * 1000) {
        return null;
      }

      // Restore the LogiVis UserId from local storage.
      // The current JWT does not yet contain the LogiVis UserId.
      const storedUserId = Number(localStorage.getItem(this.USER_ID_KEY));

      if (!storedUserId || Number.isNaN(storedUserId)) {
        return null;
      }

      return storedUserId;

    }
    catch (error) {

      console.error('Invalid JWT detected.', error);

      return null;

    }

  }

  async loadCurrentUser(userId: number): Promise<void> {

    const user = await firstValueFrom(
      this.http.get<User>(
        `${environment.workerDataApi}/internal/users/${userId}`
      )
    );

    console.log('Current User: ', user);

    // Account Status
    if (user.Status !== 'Active') {

      this.logout({
        title: 'Account Pending Approval',
        message: 'Your account has not yet been approved by an administrator.'
      });

      return;

    }

    // Super User bypass
    const isSuperUser = user.IsSuperUser || user.UserId === 1;

    // Authorization
    if (!isSuperUser && (!user.Permissions || user.Permissions.length === 0)) {

      this.logout({
        title: 'Access Revoked',
        message: 'Your account does not have permission to access LogiVis. Please contact your administrator.'
      });

      return;

    }

    localStorage.setItem(this.USER_ID_KEY, user.UserId.toString());

    this.setCurrentUser(user);

  }

  getCurrentUser(): User | null {
    return this.currentUser;
  }

  setCurrentUser(user: User): void {
    this.currentUser = user;
  }

  getToken(): string | null {
    return localStorage.getItem(this.ACCESS_TOKEN_KEY);
  }

  getUserId(): number | null {

    const userId = localStorage.getItem(this.USER_ID_KEY);

    return userId
      ? Number(userId)
      : null;

  }

  isAuthenticated(): boolean {
    return !!this.getToken();
  }

  hasAccess(): boolean {

    const user = this.currentUser;

    if (!user) {
      return false;
    }

    if (user.IsSuperUser || user.UserId === 1) {
      return true;
    }

    return !!user.Permissions &&
      user.Permissions.length > 0;

  }

  clearToken(): void {
    localStorage.removeItem(this.ACCESS_TOKEN_KEY);
  }

  logout(notification?: { title: string; message: string }): void {

    this.currentUser = null;

    localStorage.removeItem(this.ACCESS_TOKEN_KEY);
    localStorage.removeItem(this.USER_ID_KEY);

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
