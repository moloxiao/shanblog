+++
title = 'Json web token'
date = 2025-04-14T20:00:00+13:00
draft = false
tags = ["JWT", "Coding", "SaaS"]
description = "JWT (JSON Web Token) is a popular way to handle cross-domain authentication. In this post, I’ll go over how it works and how to use it."
+++
In my latest Laravel project, the backend uses Laravel APIs and the frontend is built with Next.js. I used JWT for auth, and after finishing the setup, I reviewed the basics of how JWT works.  

# 1 The Problem with Cross-Domain Authentication
Online services can’t do without user authentication. Here's how it typically works:  
1. The user sends their username and password to the server.
2. Once the server verifies the credentials, it stores some related data in the current session—like the user's role, login time, etc.
3. The server then sends a session_id back to the user and stores it in the user's cookie.
4. For every following request, the user’s browser automatically sends the session_id back to the server via cookies.
5. The server uses the session_id to retrieve the stored session data and confirm the user’s identity.

**The problem with this approach is poor scalability**. It works fine on a single server, but in a server cluster or a cross-domain service-oriented setup, session data must be shared—every server needs access to the session data.    

For example, say Website A and Website B are services under the same company. Now we want users to log in once on one site and be automatically logged in on the other. How can we achieve that?
1. One solution is to persist session data by storing it in a database or another storage layer. Each service retrieves the data from there when a request comes in. he good part is that the architecture is clear. But the downside is it takes a lot of engineering effort. Also, if that central data store goes down, it becomes a single point of failure.
2. Another approach is to not store session data on the server at all. Instead, all data is stored on the client side and sent back with every request. JWT is a typical solution that follows this approach. 


# References

* [Learn how to use JSON Web Tokens (JWT) for Authentication](https://github.com/dwyl/learn-json-web-tokens/blob/main/README.md)
* [JSON Web Token 入门教程](https://www.ruanyifeng.com/blog/2018/07/json_web_token-tutorial.html)


# TODO 

* JWT fresh
