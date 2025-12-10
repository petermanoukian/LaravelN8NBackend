<?php

// Save as: C:/wamp/www/laraveln8n/laraveln8n/debug-gemini.php

// Capture STDIN
$input = file_get_contents('php://stdin');

// Log everything Gemini sends
file_put_contents(
    __DIR__.'/storage/logs/gemini-debug.log',
    '['.date('Y-m-d H:i:s')."] INPUT:\n".$input."\n\n",
    FILE_APPEND
);

// Pass through to actual artisan command
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

if (is_resource($process)) {
    // Send input to artisan
    fwrite($pipes[0], $input);
    fclose($pipes[0]);

    // Get output
    $output = stream_get_contents($pipes[1]);
    fclose($pipes[1]);

    $error = stream_get_contents($pipes[2]);
    fclose($pipes[2]);

    // Log output
    file_put_contents(
        __DIR__.'/storage/logs/gemini-debug.log',
        '['.date('Y-m-d H:i:s')."] OUTPUT:\n".$output."\n\n",
        FILE_APPEND
    );

    if ($error) {
        file_put_contents(
            __DIR__.'/storage/logs/gemini-debug.log',
            '['.date('Y-m-d H:i:s')."] ERROR:\n".$error."\n\n",
            FILE_APPEND
        );
    }

    proc_close($process);

    // Return output to Gemini
    echo $output;
}
