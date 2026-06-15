<?php

declare(strict_types=1);

namespace App\Core\Bootstrap;

use App\Core\Http\Request;
use App\Core\Http\Response;
use App\Core\Http\Router;
use Throwable;

final class AppKernel
{
    public function __construct(private readonly ConfigLoader $configLoader)
    {
    }

    public static function boot(string $rootPath): self
    {
        return new self(new ConfigLoader($rootPath));
    }

    public function handle(Request $request): Response
    {
        try {
            return (new Router($this->configLoader->routes()))->dispatch($request);
        } catch (Throwable) {
            // TODO: Send boot/runtime exceptions to a future safe logger without exposing details.
            return Response::text('Internal Server Error', 500);
        }
    }
}
