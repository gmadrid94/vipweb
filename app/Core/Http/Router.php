<?php

declare(strict_types=1);

namespace App\Core\Http;

use Throwable;

final class Router
{
    /** @param array<int, array{method:string,path:string,handler:callable}> $routes */
    public function __construct(private readonly array $routes)
    {
    }

    public function dispatch(Request $request): Response
    {
        foreach ($this->routes as $route) {
            if ($route['method'] === $request->method() && $route['path'] === $request->path()) {
                try {
                    $response = ($route['handler'])($request);
                } catch (Throwable) {
                    // TODO: Send technical exceptions to a future safe logger without exposing details.
                    return Response::text('Internal Server Error', 500);
                }

                return $response instanceof Response
                    ? $response
                    : Response::text('Invalid route response', 500);
            }
        }

        return Response::text('Not Found', 404);
    }
}
