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

    const notification = history.state?.notification;

    if (!notification) {
      return;
    }

    this.showAlert = true;
    this.authTitle = notification.title;
    this.authError = notification.message;
  }

  loginWithLark(): void {
    const url =
      `${environment.apiUrl}/auth/lark/login?frontend=${encodeURIComponent(window.location.origin)}`;

    console.log(url);

    window.location.href = url;
  }
  
  loginWithGoogle(): void {
    const url =
      `${environment.apiUrl}/auth/google/login?frontend=${encodeURIComponent(window.location.origin)}`;

    console.log(url);

    window.location.href = url;
  }

  closeAlert(): void {
    this.showAlert = false;
  }
}
