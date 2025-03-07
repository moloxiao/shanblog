+++
title = 'Building a Website With Laravel and Nextjs Part 2 : Nextjs'
date = 2025-03-04T10:09:44+13:00
draft = false
tags = ["Laravel", "PHP", "NEXTJS"]
description = "."
+++
Built a Next.js application that integrates with a Laravel API, implementing user authentication and data fetching functionality.   

## Before start
Before starting, you need to understand the basic concepts of React Context and middleware. Here is some import things.  

### middleware
* When deploying Next.js on Vercel, Middleware runs in the Edge Runtime (V8), while API Routes and other server-side logic run in Node.js Serverless Functions.  
* Middleware is ideal for request interception, authentication, redirects, and lightweight modifications. It executes at the CDN edge, reducing server load and speeding up responses.
* API Routes are better suited for database queries and complex computations since they run in Node.js serverless environments and have access to backend resources.
Middleware cannot directly access databases, perform long-running tasks, or use certain Node.js APIs (e.g., fs for file operations).    

If your Next.js app requires authentication, A/B testing, or URL rewrites, Middleware can significantly improve performance by handling these tasks at the edge.


## Security 

### JWT  
Conclusion on Security in English
If your JWT is used exclusively for API requests, and the Next.js frontend does not directly trust user data stored on the client-side (e.g., localStorage or Cookies), then:  

1. Users cannot fake authentication by modifying localStorage or Cookies since all protected actions require a valid JWT.  
2. The backend verifies the authenticity of the JWT, ensuring that only legitimate users can access data.  

However, there are still important security considerations:  

* Use HttpOnly Cookies for token storage to prevent XSS attacks and ensure the token is not accessible via JavaScript.
* Mitigate CSRF attacks by ensuring API authentication requires Authorization: Bearer <token> instead of relying on Cookies.
* Leverage getServerSideProps for SSR authentication to fetch user data securely on the server side, improving performance and reducing unnecessary API calls on the client.
* Implement proper token expiration and revocation mechanisms on the backend to prevent unauthorized access.

