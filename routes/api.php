<?php

    use App\Models\User;
    use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/test', function (Request $request) {
    dd("tester");
});

Route::get('/test/user', function (Request $request) {
    $user = User::first();
    dd($user);
});
