<?php

declare(strict_types=1);

namespace App\Core\Http;

final class Response
{
    /** @param array<string, string> $headers */
    public function __construct(
        private readonly string $body = '',
        private readonly int $statusCode = 200,
        private readonly array $headers = [],
    ) {
    }

    /** @param array<string, mixed> $payload */
    public static function json(array $payload, int $statusCode = 200, array $headers = []): self
    {
        return new self(
            json_encode($payload, JSON_THROW_ON_ERROR | JSON_UNESCAPED_SLASHES),
            $statusCode,
            ['Content-Type' => 'application/json; charset=utf-8'] + $headers,
        );
    }

    public static function text(string $body, int $statusCode = 200, array $headers = []): self
    {
        return new self($body, $statusCode, ['Content-Type' => 'text/plain; charset=utf-8'] + $headers);
    }

    public function body(): string
    {
        return $this->body;
    }

    public function statusCode(): int
    {
        return $this->statusCode;
    }

    /** @return array<string, string> */
    public function headers(): array
    {
        return $this->headers + self::defaultHeaders();
    }

    public function send(): void
    {
        if (!headers_sent()) {
            http_response_code($this->statusCode);

            foreach ($this->headers() as $name => $value) {
                header($name . ': ' . $value, true);
            }
        }

        echo $this->body;
    }

    /** @return array<string, string> */
    private static function defaultHeaders(): array
    {
        return [
            'Content-Type' => 'text/plain; charset=utf-8',
            'X-Content-Type-Options' => 'nosniff',
            'X-Frame-Options' => 'DENY',
            'Referrer-Policy' => 'no-referrer',
        ];
    }
}
