+++
title = 'Qucik Start : Laravel'
date = 2025-02-19T20:20:01+13:00
draft = false
tags = ["QuickStart", "PHP", "JWT", "API", "SaaS"]
description = "My notes when I learn Laravel create a API project use JWT. My first use in 2025-02-19, rewrite in 2025-04-01."
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

## STEP 6 : Config JWT(tymon/jwt-auth)

install **tymon/jwt-auth** :  
```
composer require tymon/jwt-auth
```
publish config file :  
```
php artisan vendor:publish --provider="Tymon\JWTAuth\Providers\LaravelServiceProvider"
```
It will create config/jwt.php file.  

then generatejwt secret :  
```
php artisan jwt:secret
```
It will create JWT_SECRET in .env file.  
Then open config/auth.php, change :  
```
'defaults' => [
    'guard' => 'api',
    'passwords' => 'users',
],

'guards' => [
    'api' => [
        'driver' => 'jwt',
        'provider' => 'users',
    ],
],
```

## STEP 7 : Support Login 
create controller :  
```
php artisan make:controller AuthController
```
and add login method :  
```
<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->only(['email', 'password']);

        try {
            if (!$token = JWTAuth::attempt($credentials)) {
                return response()->json([
                    'success' => false,
                    'message' => 'Invalid email or password',
                    'data' => null,
                ], 401);
            }
        } catch (JWTException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Could not create token',
                'data' => null,
            ], 500);
        }

        return response()->json([
            'success' => true,
            'message' => 'Login successful',
            'data' => [
                'token' => $token,
                'token_type' => 'bearer',
                'expires_in' => config('jwt.ttl') * 60,
            ],
        ]);
    }
}

```

and update routes/api.php : 
```
use App\Http\Controllers\AuthController;

Route::post('/auth/login', [AuthController::class, 'login']);
```

then update app/Models/User.php :  
```
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    // ...

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [
            'id' => $this->id,
            'name' => $this->name,
            'email' => $this->email,
        ];
    }
}

```
When finish use postman or curl test, this is postman body(raw) json :  
```
{
  "email": "test@gmail.com",
  "password": "password"
}

```

## STEP 8 : check login 

