<?php

declare(strict_types=1);

namespace App\Core\Bootstrap;

use RuntimeException;

final class ConfigLoader
{
    public function __construct(private readonly string $rootPath)
    {
    }

    /** @return array<int, array{method:string,path:string,handler:callable}> */
    public function routes(): array
    {
        $routesFile = $this->rootPath . '/config/routes.php';

        if (!is_file($routesFile)) {
            throw new RuntimeException('Routes configuration file not found.');
        }

        $routes = require $routesFile;

        if (!is_array($routes)) {
            throw new RuntimeException('Routes configuration must return an array.');
        }

        return $routes;
    }
}
