+++
title = 'Qucik Start : Laravel'
date = 2025-02-19T10:01:04+13:00
draft = false
tags = ["QuickStart", "PHP"]
description = "My notes when I first time learn Laravel."
+++

# STEP 1 : Installing PHP and the Laravel Installer

Install php in Mac :  
```
/bin/bash -c "$(curl -fsSL https://php.new/install/mac/8.4)"
```

install the Laravel installer via Composer:  
```
composer global require laravel/installer
```

# STEP 2 : Creating an Application
Input :  
```
laravel new thought-manager
```
thought-manager is my test project name.  
you will be asked :  
```

   _                               _
  | |                             | |
  | |     __ _ _ __ __ ___   _____| |
  | |    / _` |  __/ _` \ \ / / _ \ |
  | |___| (_| | | | (_| |\ V /  __/ |
  |______\__,_|_|  \__,_| \_/ \___|_|


 Which starter kit would you like to install? [None]:
  [none    ] None
  [react   ] React
  [vue     ] Vue
  [livewire] Livewire
```
I choice none because I created a api project.  
Then you will be asked :  
```
 Which database will your application use? [SQLite]:
  [sqlite ] SQLite
  [mysql  ] MySQL
  [mariadb] MariaDB
  [pgsql  ] PostgreSQL (Missing PDO extension)
  [sqlsrv ] SQL Server (Missing PDO extension)
```
I choice default(SQLite) for test.  

Then you will be asked :  
```
 Would you like to run npm install and npm run build? (yes/no) [yes]:
```
At the end, you will see :  
```
   INFO  Application ready in [thought-manager]. You can start your local development using:

➜ cd thought-manager
➜ composer run dev

  New to Laravel? Check out our documentation. Build something amazing!
```

then :  
```
cd thought-manager
code . // I use vscode 
➜ php artisan serve
```

## STEP3 : Hello API

## STEP4 : remove no need file

## STEP5 : support login
