<?php
require 'vendor/autoload.php';
Flight::route('GET /helloworld',function(){
    echo 'Hello, World!';
});


Flight::start();
