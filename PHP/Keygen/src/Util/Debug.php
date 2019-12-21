<?php
namespace Keygen\Util;

use Exception;
class Debug
{
    public static function displayVar(...$variables)
    {
        $exception = new Exception('');
        $trace = $exception->getTrace();
        $file = $trace[0]['file'];
        $line = $trace[0]['line'];

        echo '<pre>';
        echo 'Displaying Variable' . PHP_EOL;
        echo "Called File: {$file}" . PHP_EOL;
        echo "Called Line: {$line}" . PHP_EOL;

        foreach($variables as $index => $variable) {
            echo "------------------------**#{$index}**-**START**-------------------------\n\n";
            var_dump($variable);
            echo "\n------------------------**#{$index}**-**END**-------------------------\n\n";
        }
        die();
    }

    public static function getMock()
    {
        return $results = json_decode(file_get_contents(__DIR__ . I_DS . '..' . I_DS . '..' . I_DS . '..' . I_DS . '..' . I_DS . 'data' . I_DS . 'keygen.json'));
    }
}