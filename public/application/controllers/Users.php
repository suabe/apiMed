<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
    require APPPATH.'/libraries/RestController.php';
    require APPPATH . 'libraries/Format.php';
    use chriskacerguis\RestServer\RestController;

    class Users extends RestController {
        
        function __construct() {
            parent::__construct();
        }

        public function index_get() {
            $users = [
                ['id' => 0, 'name' => 'John', 'email' => 'john@example.com'],
                ['id' => 1, 'name' => 'Jim', 'email' => 'jim@example.com'],
            ];
            $this->response( $users, 200 );
        }

        public function detail_get( $id = null ) {
            $users = [
                ['id' => 0, 'name' => 'John', 'email' => 'john@example.com'],
                ['id' => 1, 'name' => 'Jim', 'email' => 'jim@example.com'],
            ];
            if ( $id === null ) {
                // Set the response and exit
                $this->response( [
                    'status' => false,
                    'message' => 'No users were found'
                ], 400 );
                
            }
            else {
                if ( array_key_exists( $id, $users ) ) {
                    $this->response( $users[$id], 200 );
                }
                else {
                    $this->response( [
                        'status' => false,
                        'message' => 'No such user found'
                    ], 404 );
                }
            }
        }

    }