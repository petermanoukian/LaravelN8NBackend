<?php

// Save as: C:/wamp/www/laraveln8n/laraveln8n/test-mcp.php

// Log that script started
file_put_contents('C:/wamp/www/laraveln8n/laraveln8n/test-output.txt', date('Y-m-d H:i:s')." - Script started\n", FILE_APPEND);

// Read STDIN
$input = '';
while (! feof(STDIN)) {
    $line = fgets(STDIN);
    if ($line === false) {
        break;
    }
    $input .= $line;

    // Log each line received
    file_put_contents('C:/wamp/www/laraveln8n/laraveln8n/test-output.txt', 'RECEIVED: '.$line."\n", FILE_APPEND);

    // If we got a complete JSON-RPC message, respond
    $decoded = json_decode($input, true);
    if ($decoded && isset($decoded['method'])) {
        file_put_contents('C:/wamp/www/laraveln8n/laraveln8n/test-output.txt', 'METHOD: '.$decoded['method']."\n", FILE_APPEND);

        if ($decoded['method'] === 'initialize') {
            $clientVersion = $decoded['params']['protocolVersion'] ?? 'unknown';
            file_put_contents('C:/wamp/www/laraveln8n/laraveln8n/test-output.txt', 'CLIENT VERSION: '.$clientVersion."\n", FILE_APPEND);

            // Send response
            $response = json_encode([
                'jsonrpc' => '2.0',
                'id' => $decoded['id'],
                'result' => [
                    'protocolVersion' => $clientVersion,
                    'capabilities' => [
                        'tools' => new stdClass,
                        'prompts' => new stdClass,
                        'resources' => new stdClass,
                    ],
                    'serverInfo' => [
                        'name' => 'Test Server',
                        'version' => '1.0.0',
                    ],
                ],
            ]);

            echo $response."\n";
            file_put_contents('C:/wamp/www/laraveln8n/laraveln8n/test-output.txt', 'SENT: '.$response."\n", FILE_APPEND);
        }

        $input = ''; // Reset for next message
    }
}

file_put_contents('C:/wamp/www/laraveln8n/laraveln8n/test-output.txt', date('Y-m-d H:i:s')." - Script ended\n", FILE_APPEND);
