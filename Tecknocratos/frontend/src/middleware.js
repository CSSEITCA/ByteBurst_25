import { NextResponse } from 'next/server';
import { NextRequest } from 'next/server';

export function middleware(request) {
  const token = request.cookies.get('token')?.value;
  const isAuth = !!token;
  const { pathname } = request.nextUrl;

  // Allow access to login, signup, home, and public routes
  if (
    pathname === '/' ||
    pathname.startsWith('/api') ||
    pathname === '/auth' ||
    pathname === '/signup'
  ) {
    return NextResponse.next();
  }

  // Redirect to login with redirect param
  if (!isAuth && pathname.startsWith('/profile')) {
    const loginUrl = new URL('/auth', request.url);
    loginUrl.searchParams.set('redirect', pathname); // ✅ Redirect back after login
    return NextResponse.redirect(loginUrl);
  }

  return NextResponse.next();
}

export const config = {
  matcher: ['/profile'],
};
