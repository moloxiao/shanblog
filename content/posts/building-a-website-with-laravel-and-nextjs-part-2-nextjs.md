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


## 

