<?php

declare(strict_types=1);

use App\Core\Http\Request;
use App\Core\Http\Response;

return [
    [
        'method' => 'GET',
        'path' => '/health',
        'handler' => static fn (Request $request): Response => Response::json([
            'status' => 'ok',
            'runtime' => 'core-http',
        ]),
    ],
];
