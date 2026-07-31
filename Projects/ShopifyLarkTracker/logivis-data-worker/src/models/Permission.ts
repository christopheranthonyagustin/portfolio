export interface Permission {

	PermissionId: number;

	ApplicationId: number;

	Module: string;

	Code: string;

	Name: string;

	Description: string | null;

	Status: string;

	CreatedAt: string;
	CreatedByUserId: number | null;

	UpdatedAt: string | null;
	UpdatedByUserId: number | null;

}
