<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
    require APPPATH . '/libraries/CreatorJwt.php';

    class Auth_model extends CI_Model {
        public function __construct() {
            parent::__construct();
            $this->objOfJwt = new CreatorJwt();
            //Codeigniter : Write Less Do More
        }


        function paciente( $data ) {
            $this->db->select('ID ,ID_USER, PASSWORD, SALT, LAST_LOGIN');
            $this->db->where('EMAIL', $data['EMAIL']);
            $this->db->where('TYPE', 'paciente');
            $query = $this->db->get('MA_AUTH');
            if ($user = $query->row()) {
                # code...
                $password = hash('sha256', $data['PASSWORD'] . $user->SALT);
                if ($password == $user->PASSWORD) {
                    # code...
                    $this->db->reset_query();
                    $this->db->select('NAME_USER, P_LASTNAME, M_LASTNAME, EMAIL, DYNAMIC_KEY, STATUS');
                    $this->db->where('ID_USER', intval($user->ID_USER));
                    $query = $this->db->get('MA_USERS');
                    
                    if ($paciente = $query->row()) {
                        # code...
                        if ($paciente->STATUS == 'activo') {
                            # code...
                            $tokenData['id'] = $paciente->DYNAMIC_KEY;
                            $tokenData['timeStamp'] = Date('Y-m-d h:i:s');
                            $respuesta = array(
                                'error' => false,
                                'mensaje' => 'Login Correcto',
                                'token' => $this->objOfJwt->GenerateToken($tokenData),
                                'data' => $paciente,
                                'http_code' => 200
                            );
                            $this->db->reset_query();
                            date_default_timezone_set('America/Mexico_City');
                            $now = date("Y-m-d H:i:s");
                            $this->db->where('ID', $user->ID);
                            $this->db->update('MA_AUTH', array('LAST_LOGIN'=>$now,'IP'=>$_SERVER['REMOTE_ADDR']));
                        } else {
                            # code...
                            $respuesta = array(
                                'error' => TRUE,
                                'mensaje' => 'Cuenta suspendida/eliminada',
                                'data' => null,
                                'http_code' => 403
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
                    $this->db->reset_query();
                    $this->db->select('	DOCTOR_NAME, DOCTOR_P_LASTNAME, DOCTOR_M_LASTNAME, DOCTOR_EMAIL, DYNAMIC_KEY, STATUS');
                    $this->db->where('ID_DOCTOR', intval($user->ID_USER));
                    $query = $this->db->get('MA_DOCTORS');
                    
                    if ($medico = $query->row()) {
                        # code...
                        if ($medico->STATUS == 'activo') {
                            # code...
                            $tokenData['id'] = $medico->DYNAMIC_KEY;
                            $tokenData['timeStamp'] = Date('Y-m-d h:i:s');
                            $respuesta = array(
                                'error' => false,
                                'mensaje' => 'Login Correcto',
                                'token' => $this->objOfJwt->GenerateToken($tokenData),
                                'data' => $medico,
                                'http_code' => 200
                            );
                            $this->db->reset_query();
                            date_default_timezone_set('America/Mexico_City');
                            $now = date("Y-m-d H:i:s");
                            $this->db->where('ID', $user->ID);
                            $this->db->update('MA_AUTH', array('LAST_LOGIN'=>$now,'IP'=>$_SERVER['REMOTE_ADDR']));
                        } else {
                            # code...
                            $respuesta = array(
                                'error' => TRUE,
                                'mensaje' => 'Cuenta suspendida/eliminada',
                                'data' => null,
                                'http_code' => 403
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