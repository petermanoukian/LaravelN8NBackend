<?php

// Save as: C:/wamp/www/laraveln8n/laraveln8n/mcp-adapter.php
// Intercepts Gemini's 2025-11-25 protocol and downgrades to 2025-06-18

// Start Laravel artisan process
$descriptors = [
    0 => ['pipe', 'r'],  // stdin
    1 => ['pipe', 'w'],  // stdout
    2 => ['pipe', 'w'],  // stderr
];

$process = proc_open(
    'C:/wamp/bin/php/php8.2.0/php.exe artisan mcp:start ping-server --quiet',
    $descriptors,
    $pipes,
    __DIR__
);

if (! is_resource($process)) {
    exit(1);
}

// Make pipes non-blocking
stream_set_blocking($pipes[1], false);
stream_set_blocking($pipes[2], false);
stream_set_blocking(STDIN, false);

$buffer = '';

while (true) {
    // Read from Gemini (STDIN)
    $input = fread(STDIN, 8192);
    if ($input !== false && $input !== '') {
        $buffer .= $input;

        // Try to parse complete JSON messages
        while (($pos = strpos($buffer, "\n")) !== false) {
            $line = substr($buffer, 0, $pos);
            $buffer = substr($buffer, $pos + 1);

            $decoded = json_decode($line, true);
            if ($decoded && isset($decoded['method'])) {
                // ✅ Downgrade protocol version
                if ($decoded['method'] === 'initialize' &&
                    isset($decoded['params']['protocolVersion']) &&
                    $decoded['params']['protocolVersion'] === '2025-11-25') {
                    $decoded['params']['protocolVersion'] = '2025-06-18';
                }

                // Forward to Laravel
                fwrite($pipes[0], json_encode($decoded)."\n");
            } else {
                // Forward as-is if not JSON-RPC
                fwrite($pipes[0], $line."\n");
            }
        }
    }

    // Read from Laravel (stdout) and forward to Gemini
    $output = fread($pipes[1], 8192);
    if ($output !== false && $output !== '') {
        echo $output;
        flush();
    }

    // Check if process ended
    $status = proc_get_status($process);
    if (! $status['running']) {
        break;
    }

    usleep(10000); // 10ms sleep to prevent CPU spinning
}

fclose($pipes[0]);
fclose($pipes[1]);
fclose($pipes[2]);
proc_close($process);
