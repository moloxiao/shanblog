+++
title = 'Qucik Start : Laravel'
date = 2025-02-19T10:01:04+13:00
draft = false
tags = ["QuickStart", "PHP"]
description = "My notes when I first time learn Laravel."
+++

## STEP 1 : Installing PHP and the Laravel Installer

Install php in Mac :  
```
/bin/bash -c "$(curl -fsSL https://php.new/install/mac/8.4)"
```

install the Laravel installer via Composer:  
```
composer global require laravel/installer
```

## STEP 2 : Creating an Application
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

## STEP 3 : Hello API
update routes/web.php :  
```
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TestController;

Route::get('/', function () {
    return response()->json([
        'success' => true,
        'message' => 'Hello, I am thought manager.'
    ]);
});

Route::prefix('api')->group(function () {
    Route::get('/test', [TestController::class, 'index']);
});

```

but this will have some problem about **CSRF**, so we need update.  
open bootstrap/app.php : 
```
return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        api: __DIR__.'/../routes/api.php', // add this line
    )
    ->withMiddleware(function() {
        //
    })
    ->withExceptions(function() {
        //
    })
    ->create();

```
and create a new file in routes/api.php :  
```
<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\TestController;

Route::prefix('v1')->group(function () {
    
    Route::get('/test', [TestController::class, 'index']);
});
```

## STEP 4 : remove no need file

```
#!/bin/bash
echo "Cleaning Laravel frontend resources for API-only project..."

rm -rf resources
rm -rf public/build
rm -rf node_modules
rm -f vite.config.js
rm -f tailwind.config.js
rm -f postcss.config.js
rm -f package.json
rm -f package-lock.json

echo "✅ Cleanup complete. Your Laravel API project is now lean and clean!"

```

## STEP 5 : Init DB
The local SQLite database was created and the initial migrations were completed automatically during Laravel's initialization. My only task now is to add a test user.  

1. Add a password line in database/seeders/DatabaseSeeder.php:
```
<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        User::factory()->create([
            'name' => 'Test User',
            'email' => 'test@gmail.com',
            'password' => Hash::make('password'), // default not contain this line
        ]);
    }
}
```

2. Run the database seeding command:
```
php artisan db:seed
```

## STEP 6 : Config JWT

## STEP 7 : Support Login 

## STEP 8 : check login 

