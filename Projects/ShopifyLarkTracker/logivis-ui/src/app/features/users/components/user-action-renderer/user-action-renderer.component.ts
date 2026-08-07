import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import {
  ICellRendererAngularComp
} from 'ag-grid-angular';

@Component({
  selector: 'app-user-action-renderer',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './user-action-renderer.component.html',
  styleUrl: './user-action-renderer.component.scss'
})
export class UserActionRendererComponent
  implements ICellRendererAngularComp {

  params: any;

  agInit(params: any): void {

    this.params = params;

  }

  refresh(params: any): boolean {

    this.params = params;

    return true;

  }

  edit(): void {

    this.params.onEdit(this.params.data);

  }

}
