import { Permission } from "./Permission";
import { Role } from "./Role";
import { Companies } from "./Companies";
export interface User {
  UserId: number;
  CompanyId: number;

  ProviderUserId: string;

  Email: string;

  FirstName: string;
  LastName: string;
  DisplayName: string;

  CompanyName: string;
  IsSuperUser: boolean;
  Status: string;

  LastLoginAt: string | null;

  CreatedAt: string;
  CreatedByUserId: number | null;

  UpdatedAt: string | null;
  UpdatedByUserId: number | null;
  Role: Role | null;

  Permissions: Permission[];
  Companies: Companies[];

}
