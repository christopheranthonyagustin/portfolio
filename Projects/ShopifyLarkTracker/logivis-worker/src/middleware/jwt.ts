import { jwtVerify, type JWTPayload } from "jose";

export interface AuthUser extends JWTPayload {
	sub: string;
	email: string;
	given_name?: string;
	family_name?: string;
}

export async function verifyJwt(
	request: Request,
	env: Env
): Promise<AuthUser> {

	const authorization = request.headers.get("Authorization");

	if (!authorization?.startsWith("Bearer ")) {
		throw new Error("Missing bearer token");
	}

	const token = authorization.substring(7);

	const secret = new TextEncoder().encode(env.JWT_SECRET);

	const { payload } = await jwtVerify(token, secret, {
		issuer: env.JWT_ISSUER,
		audience: env.JWT_AUDIENCE
	});

	return payload as AuthUser;
}
