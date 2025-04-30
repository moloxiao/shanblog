+++
title = ' My Tech Stack Selection - 2025 - SaaS'
date = 2025-01-01T20:01:01+13:00
draft = false
tags = ["TechStack", "SaaS"]
description = "My default tech stack selection for typical SaaS systems in 2025."
+++


## Overview

This document explains my technology stack selection for SaaS projects in 2005. I use different stacks depending on the purpose of the project.

If the goal is to quickly test an idea, I will use Next.js with Clerk and Supabase. Firebase can also be used as a replacement for Supabase.

If the project is something I believe in and want to keep building for the long term, I will use a more flexible and scalable architecture. This structure includes Laravel for the backend, Next.js for the frontend, Supabase for the database, and a VPS like Vultr for hosting.

---

## Stack Comparison by Use Case

| Purpose             | Stack                                    | Why I Choose It                                               |
|---------------------|------------------------------------------|----------------------------------------------------------------|
| MVP or quick test   | Next.js + Clerk + Supabase or Firebase   | Easy to set up. No need to manage backend. Cost effective.     |
| Long-term project   | Laravel + Next.js + Supabase + VPS       | More control. Easier scaling. Clear separation of concerns.    |

---

## Stack Components and Hosting

| Component     | Tool or Service Used               | Notes                                                       |
|---------------|------------------------------------|-------------------------------------------------------------|
| Frontend      | Next.js                            | Deployed on Vercel                                          |
| Backend       | Laravel                            | Deployed on Vultr using Docker                              |
| Auth          | Clerk or Supabase Auth             | Simple and ready to use                                     |
| Database      | Supabase PostgreSQL or AWS RDS     | Supabase for quick start. RDS for high performance later.   |
| File Storage  | Supabase Storage or S3-compatible  | Can switch to AWS S3 when needed                            |
| CI/CD         | GitHub Actions                     | Easy to integrate into deployment workflow                  |

---

## AWS Migration Plan

This setup can grow with the project. It allows smooth migration to AWS when needed.

| Area             | Start With                        | Later Move To                     | Migration Difficulty |
|------------------|-----------------------------------|-----------------------------------|----------------------|
| Backend Server   | Vultr VPS                         | AWS EC2 or ECS                    | Low                  |
| Database         | Supabase PostgreSQL               | AWS RDS or Aurora                 | Low                  |
| File Storage     | Supabase Storage                  | AWS S3                            | Very Low             |
| Frontend Hosting | Vercel                            | AWS Amplify or CloudFront         | Optional             |
| Backups          | Cron and local scripts            | RDS automatic snapshots           | Low                  |
| CI/CD            | GitHub Actions                    | AWS CodePipeline                  | Optional             |

---

## Key Benefits of This Architecture

| Benefit                     | Reason                                                                 |
|-----------------------------|------------------------------------------------------------------------|
| Easy to Start               | All tools have good documentation and free plans                      |
| Modular and Replaceable     | Each part can be updated or changed independently                     |
| Future Proof                | Can move to cloud-native or enterprise-grade services when needed     |
| Cost Control                | Only pay for what is needed at each stage of the project              |
| Developer Friendly          | Familiar tools and smooth developer experience                        |

---

## Best Practices

| Practice                    | Description                                                           |
|-----------------------------|------------------------------------------------------------------------|
| Use environment variables   | Make all external services configurable through .env files            |
| Keep Docker setup clean     | Use Docker Compose to manage services locally or on VPS               |
| Avoid platform lock-in      | Stick to open standards like PostgreSQL and S3 APIs                   |
| Monitor connection limits   | Supabase and RDS have connection limits to be aware of                |
| Plan for latency            | If using Supabase from a VPS, pick nearby regions to reduce latency   |

---

## Conclusion

This stack allows fast validation and supports long-term scaling. It balances simplicity and control. It is easy to start and ready for future growth.
