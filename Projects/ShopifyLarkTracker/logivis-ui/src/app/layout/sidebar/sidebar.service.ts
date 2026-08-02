import { Injectable, signal } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SidebarService {

  readonly collapsed = signal(window.innerWidth <= 768);

  toggle(): void {
    this.collapsed.update(value => !value);
  }

  expand(): void {
    this.collapsed.set(false);
  }

  collapse(): void {
    this.collapsed.set(true);
  }

}
