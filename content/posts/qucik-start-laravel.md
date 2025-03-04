+++
title = 'Qucik Start Laravel'
date = 2025-02-19T10:01:04+13:00
draft = true
tags = ["QuickStart", "PHP"]
description = "My notes when I first time learn Laravel."
+++

# Installing PHP and the Laravel Installer

Install php in Mac :  
```
/bin/bash -c "$(curl -fsSL https://php.new/install/mac/8.4)"
```

install the Laravel installer via Composer:  
```
composer global require laravel/installer
```

# Creating an Application
Input :  
```
laravel new hello
```
The Laravel installer will prompt you to select your preferred testing framework, database, and starter kit.
# Creating a Markdown table summarizing the differences between Laravel Starter Kits


Laravel Starter Kits Comparison :  

| Feature                  | No Starter Kit | Laravel Breeze    | Laravel Jetstream |
|--------------------------|---------------|------------------|------------------|
| Authentication (Login/Register) | ❌ No | ✅ Yes (Basic) | ✅ Yes (Advanced) |
| Password Reset & Email Verification | ❌ No | ✅ Yes | ✅ Yes |
| Two-Factor Authentication (2FA) | ❌ No | ❌ No | ✅ Yes |
| API Authentication (Sanctum) | ❌ No | ❌ No | ✅ Yes |
| Multi-User Sessions | ❌ No | ❌ No | ✅ Yes |
| Team Management | ❌ No | ❌ No | ✅ Yes |
| UI Technology | ❌ None | Blade (default), Vue, React | Livewire (Blade) or Inertia.js (Vue/React) |
| Best For | Full custom projects | Small to medium apps | Large, complex apps |

Summary :  
- **No Starter Kit**: Best for full control, API-only projects, or custom authentication.
- **Laravel Breeze**: Best for small to medium projects that need quick authentication setup.
- **Laravel Jetstream**: Best for complex applications needing 2FA, multi-session, and team management.

"""

then :  
```
cd hello
code . // I use vscode 
➜ npm install && npm run build
➜ composer run dev
```

## 启动命令

