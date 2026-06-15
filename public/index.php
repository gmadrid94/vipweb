<?php

declare(strict_types=1);

use App\Core\Bootstrap\AppKernel;
use App\Core\Http\Request;

$rootPath = dirname(__DIR__);

require $rootPath . '/app/Core/Http/Request.php';
require $rootPath . '/app/Core/Http/Response.php';
require $rootPath . '/app/Core/Http/Router.php';
require $rootPath . '/app/Core/Bootstrap/ConfigLoader.php';
require $rootPath . '/app/Core/Bootstrap/AppKernel.php';

AppKernel::boot($rootPath)
    ->handle(Request::fromGlobals())
    ->send();
