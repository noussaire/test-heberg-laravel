<?php

Route::get('/', function () {
    return view('welcome');
});

Route::get('/test', function () {
    return "Bonjour depuis Laravel 🚀";
});
