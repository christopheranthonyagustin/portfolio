import { Injectable, signal } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class SidebarService {

  readonly collapsed = signal(false);

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
