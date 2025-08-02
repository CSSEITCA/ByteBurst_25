export function isAuthenticated() {
  // For now, we'll assume you're using localStorage to store login token.
  return localStorage.getItem("token") !== null;
}
