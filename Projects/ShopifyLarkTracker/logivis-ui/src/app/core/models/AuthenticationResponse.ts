import { User } from './User';

export interface AuthenticationResponse {

  success: boolean;

  code: string;

  message: string;

  token?: string;

  user?: User;

  // Lark OAuth user access token
  userAccessToken?: string;

}
