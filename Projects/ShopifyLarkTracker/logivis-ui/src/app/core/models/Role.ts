export interface Role {

  RoleId: number;

  Name: string;

  Description: string | null;
  Code: string;
  Status: string;

  CreatedAt: string;
  CreatedByUserId: number | null;

  UpdatedAt: string | null;
  UpdatedByUserId: number | null;

}
