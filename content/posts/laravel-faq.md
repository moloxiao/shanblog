+++
title = 'Laravel FAQ'
date = 2025-03-04T11:04:01+13:00
draft = false
tags = ["Laravel", "PHP"]
description = "."
+++

## FAQ

### Q-1 config & env
In Laravel, there are several important differences between directly using the env() function and accessing environment variables through the config() function:

1. **Caching Mechanism** : Direct env() usage: When you use env() directly in your application code, Laravel reads from the .env file on every request, which is not cached.
Using config(): Laravel can cache configuration files (via php artisan config:cache command) to improve performance. When configurations are cached, the .env file is no longer read, and the system uses the cached configuration values instead.
2. **Production Best Practices** : Laravel officially recommends using env() in configuration files and then using config() in your application code. This is because **when you run config:cache in production, code that directly uses env() will not be able to retrieve environment variable values**.

```
php artisan config:cache # every time when update .env we need run this
```


## Deployment

Laravel offers two official deployment services: 
* [Forge : for traditional server management](https://forge.laravel.com/) 
* [Vapor :  for serverless deployment on AWS](https://vapor.laravel.com/)
