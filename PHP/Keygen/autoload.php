<?php
/**
 * Replaces a directory path with the correct separators.
 * The directory path is checked on return.  If the path is not valid false is returned.
 *
 * @param string $string
 * @return string|false
 */
function replaceDS($string) {
    return realpath(str_replace(DIRECTORY_SEPARATOR === '/' ? '\\' : '/', DIRECTORY_SEPARATOR, $string));
}

/**
 * Checks if the prefix is present.
 * Creates the proper class file path.
 * Checks if the file path is valid.
 *
 * If either checks fail false is returned.
 * The file path is returned as a string if the checks pass.
 *
 * @param string $class_name
 * @param string $class_prefix
 * @param string $base_directory
 * @return false|string
 */
function createClassFilePath($class_name, $class_prefix, $base_directory) {
    $prefix_length = strlen($class_prefix);

    // Returning false if prefix is not discovered.
    if(strncmp($class_name, $class_prefix, $prefix_length) !== 0) return false;

    // Removing prefix
    $prefix_removed = substr($class_name, $prefix_length);

    // Formatting class filename.
    return replaceDS("{$base_directory}/{$prefix_removed}.php");
}


spl_autoload_register(function($class) {
    // If $file is false returning else include file.
    $file = createClassFilePath($class, 'Keygen', __DIR__ . DIRECTORY_SEPARATOR . 'src');
    return !$file ? false : include_once($file);
});

Keygen\Util\Settings::get('slug', '**slug**');
Keygen\Util\Settings::get('token', '**token**');

$user = Keygen\User\User::getUser('ab88895a-0997-45a5-8380-611559153da0');
echo json_encode($user);
/*
 {
     "id": "ab88895a-0997-45a5-8380-611559153da0",
     "fullName": "Jon Taylor",
     "firstName": "Jon",
     "lastName": "Taylor",
     "email": "jonnytest1101@icloud.com",
     "role": "user",
     "metadata": {}
 }
 */