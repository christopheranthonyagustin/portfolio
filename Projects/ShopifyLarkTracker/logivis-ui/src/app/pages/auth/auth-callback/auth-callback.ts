import { Component, OnInit, inject } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { firstValueFrom } from 'rxjs';

import { AuthService } from '../../../features/auth/services/auth.service';

@Component({
  selector: 'app-auth-callback',
  standalone: true,
  template: `<p>Signing in...</p>`
})
export class AuthCallbackComponent implements OnInit {

  private readonly route = inject(ActivatedRoute);
  private readonly router = inject(Router);
  private readonly authService = inject(AuthService);

  async ngOnInit(): Promise<void> {

    const params = await firstValueFrom(this.route.queryParams);

    const token = params['token'];
    const userId = Number(params['userId']);
    const error = params['error'];

    if (error) {

      await this.router.navigate(['/login'], {
        state: {
          notification: {
            title: 'Authentication Failed',
            message: 'Unable to authenticate your account. Please try again.'
          }
        }
      });

      return;

    }

    if (!token) {

      await this.router.navigate(['/login'], {
        state: {
          notification: {
            title: 'Invalid Authentication',
            message: 'Authentication response is invalid.'
          }
        }
      });

      return;

    }

    localStorage.setItem('access_token', token);

    try {

      if (userId > 0) {
        await this.authService.loadCurrentUser(userId);
      }

      const currentUser = this.authService.getCurrentUser();

      // AuthService already redirected if authorization failed.
      if (!currentUser) {
        return;
      }

      await this.router.navigate(['/dashboard'], {
        state: {
          notification: {
            title: 'Welcome',
            message: `Welcome back, ${currentUser.DisplayName}!`
          }
        }
      });

    }
    catch (err: any) {

      console.error('Failed to load current user.', err);

      if (err?.status === 404) {

        await this.router.navigate(['/login'], {
          state: {
            notification: {
              title: 'Account Not Found',
              message: 'Your account could not be found. Please contact your administrator.'
            }
          }
        });

        return;

      }

      await this.router.navigate(['/login'], {
        state: {
          notification: {
            title: 'Unable to Load Account',
            message: 'We could not retrieve your account information. Please try again later.'
          }
        }
      });

    }

  }

}
