<?php

/**
 * @license Apache 2.0
 */

namespace Auth;

/**
 * Class User
 *
 * @package Petstore30
 *
 * @OA\Schema(
 *     title="Login model",
 *     description="Login model",
 * )
 */
class Auth
{
    /**
     * @OA\Property(
     *     description="Email",
     *     title="Email",
     * )
     *
     * @var string
     */
    private $email;

    /**
     * @OA\Property(format="int64", description="Password", title="Password", maximum=255)
     * @var string
     */
    private $password;
}
