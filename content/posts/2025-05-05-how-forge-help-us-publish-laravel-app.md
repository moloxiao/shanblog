+++
title = 'How Forge Help Us Publish Laravel App'
date = 2025-05-05T20:02:09+13:00
draft = false
tags = ["Laravel", "Forge"]
description = ""
+++


## Laravel Forge Best Practices for Production Deployments


### 1. **Standardized Environment Configuration**

* **PHP-FPM set to production mode**

  * `display_errors` is disabled to prevent PHP warnings or errors from being sent in HTTP responses.
  * `log_errors` is enabled to ensure all errors/exceptions are written to log files, not sent to API consumers.
* **Proper output buffering configuration**

  * Output buffering is enabled so that any stray `echo`/`print` output is captured and only sent with the intended response, preventing accidental output pollution.
* **Correct Content-Type headers**

  * Nginx is configured to set `application/json` for API responses, preventing content-type mismatches.

---

### 2. **Exception & Code Hygiene**

* **No `set_exception_handler` or debug output in entry files**

  * Never use manual exception handlers or debugging `echo`/`print` in `public/index.php` or anywhere else outside of Laravel’s core.
* **Centralized exception handling**

  * All exceptions are processed through Laravel’s global handler (`app/Exceptions/Handler.php`), ensuring consistent, clean error responses.
* **No debug code left behind**

  * Forge environments are “clean”: no leftover development code (such as `echo`, `var_dump`, `print_r`) that could pollute production responses.
* **Logging goes to files, not to output**

  * All logs and debug information are routed to `storage/logs/` and never mixed into HTTP responses.

---

### 3. **File and Directory Permissions**

* **Automatic configuration of storage, cache, and session directories**

  * Ensures the web server user (`www-data`) has the correct permissions, preventing permission-denied errors and related PHP warnings.
* **Persistent log/cache/session storage (for Docker setups)**

  * Prevents issues like log file overflow or lost session/cache data that can lead to runtime errors or polluted responses.

---

### 4. **Nginx & PHP-FPM Best Practices**

* **Standard Nginx configuration**

  * Proper `fastcgi_param` paths and permissions.
  * Only `.php` files are proxied to PHP-FPM; static assets are served directly by Nginx.
  * Error pages (e.g., 500) are served only on actual fatal errors, never mingling with API output.
* **Health checks & automatic restarts**

  * PHP-FPM and Nginx are periodically restarted to avoid memory leaks or resource exhaustion.

---

### 5. **Environment Variables & Security**

* **Use of `.env.production` or `.env` with production settings**

  * Ensures `APP_ENV=production`, `APP_DEBUG=false` for a secure, stable environment.
* **Best-practice configuration for DB, cache, and session services**

  * All supporting services are configured with production-grade security and performance.

---

### 6. **Automated Operations and Continuous Deployment**

* **Deployment scripts and rollback mechanisms**

  * Forge runs scripts to execute `migrate`, `cache:clear`, `config:cache`, etc., ensuring a consistent deployment.
* **Automated security and package updates**

  * PHP, Nginx, and SSL certificates are automatically updated, keeping the platform secure.

---

**Summary**

> **Forge helps you implement all the Laravel and community-recommended production best practices by default, ensuring your app is secure, stable, and delivers clean JSON responses without being “polluted” by rogue debug or misconfigurations.**

---

