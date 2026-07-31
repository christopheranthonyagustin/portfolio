import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { environment } from '../../../../../environments/environment';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.scss'
})
export class LoginComponent implements OnInit {

  version = '1.0.0';

  showAlert = false;
  authTitle = '';
  authError = '';
  authCode = '';

  ngOnInit(): void {

    const state = history.state;

    if (!state?.code) {
      return;
    }

    this.showAlert = true;
    this.authCode = state.code;
    this.authError = state.message ?? '';

    switch (this.authCode) {

      case 'PENDING':
        this.authTitle = 'Account Pending Approval';
        break;

      case 'UNAUTHORIZED':
        this.authTitle = 'Access Denied';
        break;

      case 'SUSPENDED':
        this.authTitle = 'Account Suspended';
        break;

      default:
        this.authTitle = 'Authentication Failed';
        break;
    }
  }

  loginWithLark(): void {
    window.location.href = `${environment.apiUrl}/auth/lark/login`;
  }

  loginWithGoogle(): void {
    window.location.href = `${environment.apiUrl}/auth/google/login`;
  }

  closeAlert(): void {
    this.showAlert = false;
  }
}
