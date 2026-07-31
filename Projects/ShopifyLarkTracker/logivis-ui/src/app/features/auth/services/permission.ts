import { Injectable } from '@angular/core';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class PermissionService {

  constructor(private authService: AuthService) { }

  has(permissionCode: string): boolean {

    const user = this.authService.getCurrentUser();

    if (!user) {
      return false;
    }

    if (user.IsSuperUser) {
      return true;
    }

    return user.Permissions?.some(p => p.Code === permissionCode) ?? false;

  }

  hasAny(permissionCodes: string[]): boolean {

    return permissionCodes.some(code => this.has(code));

  }

  hasAll(permissionCodes: string[]): boolean {

    return permissionCodes.every(code => this.has(code));

  }

}
