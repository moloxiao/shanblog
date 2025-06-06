+++
title = 'Nextjs FAQ'
date = 2025-03-04T11:04:01+13:00
draft = false
tags = ["NEXTJS"]
description = "."
+++

## When to Use Direct API Calls vs. Next.js Server Proxy
Use Next.js API Routes when:  
* You need to hide API keys or other secrets  
* You want to aggregate multiple API calls  
* You need to transform data before sending it to the client  
* Your API requires complex authentication that's better handled server-side  
  
Direct API calls might be acceptable when:  
* The API is public and requires no sensitive credentials
* You're working with a simple prototype
* The backend already handles CORS and is specifically designed for browser access
* You need real-time updates (although you could still use WebSockets through Next.js)  

## Why and when use React Context  
React Context is designed to solve the "Props Drilling" problem, where deeply nested components need access to shared data, but passing props through multiple levels becomes cumbersome. It allows global state sharing, making it useful for themes, authentication, and localization.   

**AuthContext Example**  
1. Create AuthContext with a Provider

Stores user state and provides login/logout functions.
Uses useContext to allow any component to access authentication data.  

2. Wrap Application with AuthProvider

Ensures all child components can use authentication state.

3. Consume AuthContext in Components

Example: Navbar accesses user, login, and logout functions via useAuth().
  

**Key Benefits**  
* Eliminates unnecessary prop-passing.
* Provides a structured way to manage global state.
* Improves maintainability and readability of code.

## Pitfalls Collection

### 1 Next.js Link Prefetching Behavior

Next.js Link component automatically prefetches page data when links enter the viewport in production, but this feature is disabled in development mode. This can lead to unexpected 404 errors in production if the linked pages don't exist - a common issue that can be resolved by adding prefetch={false} to disable this behavior.


## How to Avoid the “Stuck on Redirecting” Issue After Login in Next.js

In Next.js (especially when deployed on Vercel with SSR), you may encounter a problem where, after a successful login, the page displays “Redirecting...” but never actually navigates to your dashboard. This happens because `router.push("/dashboard")` only updates the client-side route—**it does not trigger a full page reload, so cookies or JWT tokens set by your login API may not be immediately available to your authentication context or SSR logic.** As a result, your app thinks you are still not logged in, and you get stuck on the “Redirecting” screen.

**Best Practice:**  
After a successful login, use `window.location.href` for navigation instead of `router.push`. This forces a full page reload, ensuring that authentication cookies or tokens are correctly read by both the browser and your app’s authentication provider.

### Example (TypeScript)

```typescript
async function onSubmit(values: LoginFormValues) {
  setLoginState(LoginState.SUBMITTING);
  const loginResult = await login(values.email, values.password);
  if (loginResult) {
    setLoginState(LoginState.SUCCESS);
    // This reloads the page, syncing cookies/tokens for auth
    window.location.href = "/dashboard";
    return;
  } else {
    setLoginState(LoginState.ERROR);
  }
}
