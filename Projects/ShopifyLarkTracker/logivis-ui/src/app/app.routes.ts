import { Routes } from '@angular/router';

import { LoginComponent } from './features/auth/pages/login/login.component';
import { AuthCallbackComponent } from './pages/auth/auth-callback/auth-callback';
import { DashboardPageComponent } from './features/dashboard/pages/dashboard-page.component';
import { ShipmentPageComponent } from './features/shipments/pages/shipment-page.component';
import { UsersPageComponent } from './features/users/pages/users-page.component';
import { authGuard } from './guards/auth-guard';


export const routes: Routes = [

  {
    path: '',
    redirectTo: 'login',
    pathMatch: 'full'
  },

  {
    path: 'login',
    component: LoginComponent
  },

  {
    path: 'auth/callback',
    component: AuthCallbackComponent
  },

  {
    path: 'dashboard',
    component: DashboardPageComponent,
    canActivate: [authGuard]
  },

  {
    path: 'shipments',
    component: ShipmentPageComponent,
    canActivate: [authGuard]
  },
  {
    path: 'users',
    component: UsersPageComponent,
    canActivate: [authGuard]
  },
  {
    path: '**',
    redirectTo: 'login'
  }

];
