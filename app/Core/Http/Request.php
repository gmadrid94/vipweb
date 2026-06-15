<?php

declare(strict_types=1);

namespace App\Core\Http;

final class Request
{
    /**
     * @param array<string, mixed> $query
     * @param array<string, mixed> $body
     * @param array<string, string> $headers
     * @param array<string, mixed> $cookies
     * @param array<string, mixed> $server
     */
    public function __construct(
        private readonly string $method,
        private readonly string $path,
        private readonly array $query = [],
        private readonly array $body = [],
        private readonly array $headers = [],
        private readonly array $cookies = [],
        private readonly array $server = [],
    ) {
    }

    public static function fromGlobals(): self
    {
        $server = $_SERVER;
        $method = strtoupper((string) ($server['REQUEST_METHOD'] ?? 'GET'));
        $uri = (string) ($server['REQUEST_URI'] ?? '/');
        $path = parse_url($uri, PHP_URL_PATH);

        return new self(
            $method,
            self::normalizePath(is_string($path) ? $path : '/'),
            $_GET,
            $_POST,
            self::headersFromServer($server),
            $_COOKIE,
            $server,
        );
    }

    public function method(): string
    {
        return $this->method;
    }

    public function path(): string
    {
        return $this->path;
    }

    /** @return array<string, mixed> */
    public function query(): array
    {
        return $this->query;
    }

    /** @return array<string, mixed> */
    public function body(): array
    {
        return $this->body;
    }

    /** @return array<string, string> */
    public function headers(): array
    {
        return $this->headers;
    }

    /** @return array<string, mixed> */
    public function cookies(): array
    {
        return $this->cookies;
    }

    /** @return array<string, mixed> */
    public function server(): array
    {
        return $this->server;
    }

    private static function normalizePath(string $path): string
    {
        $normalized = '/' . ltrim($path, '/');
        $trimmed = rtrim($normalized, '/');

        return $trimmed === '' ? '/' : $trimmed;
    }

    /**
     * @param array<string, mixed> $server
     * @return array<string, string>
     */
    private static function headersFromServer(array $server): array
    {
        $headers = [];

        foreach ($server as $key => $value) {
            if (!is_scalar($value)) {
                continue;
            }

            if (str_starts_with($key, 'HTTP_')) {
                $name = str_replace(' ', '-', ucwords(strtolower(str_replace('_', ' ', substr($key, 5)))));
                $headers[$name] = (string) $value;
            }
        }

        if (isset($server['CONTENT_TYPE']) && is_scalar($server['CONTENT_TYPE'])) {
            $headers['Content-Type'] = (string) $server['CONTENT_TYPE'];
        }

        if (isset($server['CONTENT_LENGTH']) && is_scalar($server['CONTENT_LENGTH'])) {
            $headers['Content-Length'] = (string) $server['CONTENT_LENGTH'];
        }

        return $headers;
    }
}
