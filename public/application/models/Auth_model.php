<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    class Auth_model extends CI_Model {
        public function __construct() {
            parent::__construct();
            //Codeigniter : Write Less Do More
        }


        function paciente( $data ) {
            $this->db->select('ID_USER, PASSWORD, SALT, LAST_LOGIN');
            $this->db->where('EMAIL', $data['EMAIL']);
            $this->db->where('TYPE', 'paciente');
            $query = $this->db->get('MA_AUTH');
            if ($user = $query->row()) {
                # code...
                $password = hash('sha256', $data['PASSWORD'] . $user->SALT);
                if ($password == $user->PASSWORD) {
                    # code...
                    $respuesta = array(
                        'error' => false,
                        'mensaje' => 'Login Correcto',
                        'http_code' => 200
                    );
                } else {
                    # code...
                    $respuesta = array(
                        'error' => TRUE,
                        'mensaje' => 'Error en Email/Contraseña',
                        'http_code' => 400
                    );
                }    
            } else {
                # code...
                $respuesta = array(
                    'error' => TRUE,
                    'mensaje' => 'No exsiste el paciente',
                    'http_code' => 404
                );

            }
            return $respuesta;
        }

        function medico( $data ) {
            $this->db->select('ID_USER, PASSWORD, SALT, LAST_LOGIN');
            $this->db->where('EMAIL', $data['EMAIL']);
            $this->db->where('TYPE', 'medico');
            $query = $this->db->get('MA_AUTH');
            if ($user = $query->row()) {
                # code...
                $password = hash('sha256', $data['PASSWORD'] . $user->SALT);
                if ($password == $user->PASSWORD) {
                    # code...
                    $respuesta = array(
                        'error' => false,
                        'mensaje' => 'Login Correcto',
                        'http_code' => 200
                    );
                } else {
                    # code...
                    $respuesta = array(
                        'error' => TRUE,
                        'mensaje' => 'Error en Email/Contraseña',
                        'http_code' => 400
                    );
                }
                
            } else {
                # code...
                $respuesta = array(
                    'error' => TRUE,
                    'mensaje' => 'No exsiste el medico',
                    'http_code' => 404
                );

            }
            
            return $respuesta;
        }

    }