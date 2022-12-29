<?php 
    defined('BASEPATH') OR exit('No direct script access allowed');

    class Pacientes_model extends CI_Model {
        public function __construct() {
            parent::__construct();
            //Codeigniter : Write Less Do More
        }

        function all() {
            $query = $this->db->get_where('MA_USERS',array('STATUS' => 'activo'));
            return $query->result_array();
        }

        function detail($id) {
            $query = $this->db->get_where('MA_USERS',array('ID_USER' => $id, 'STATUS' => 'activo' ));
            return $query->row_array();
        }

        function create($data) {
            $this->db->set('NAME_USER', $data['NAME_USER']);
            $this->db->set('P_LASTNAME', $data['P_LASTNAME']);
            $this->db->set('M_LASTNAME', $data['M_LASTNAME']);
            $this->db->set('PHONE_NUMBER', $data['PHONE_NUMBER']);
            $this->db->set('BIRTHDATE', $data['BIRTHDATE']);
            $this->db->set('GENDER', $data['GENDER']);
            $this->db->set('PLACE_OF_BIRTH', $data['PLACE_OF_BIRTH']);
            $this->db->set('MARITAL_STATUS', $data['MARITAL_STATUS']);
            $this->db->set('EMAIL', $data['EMAIL']);
            $this->db->set('DYNAMIC_KEY', hash("md5", $data['EMAIL']));
            $this->db->set('STATUS', 'activo');

            if ($this->db->insert('MA_USERS')) {
                # code...
                $respuesta = array(
                    'error' => FALSE,
                    'mensaje' => 'Paciente creado correctamente',
                    'USER_ID' => $this->db->insert_id(),
                    'http_code' => 200
                );
                $this->create_auth($this->db->insert_id(),$data);
            } else {
                # code...
                $respuesta = array(
                    'error' => TRUE,
                    'mensaje' => 'Error al crear paciente',
                    'DB_error' => $this->db->_error_message(),
                    'DB_error_num' => $this->db->_error_number(),
                    'http_code' => 500
                );
            }

            return $respuesta;
        }

        function create_auth($id,$data) {
            $this->load->helper('string');

            $this->db->set('ID_USER', $id);
            $this->db->set('EMAIL', $data['EMAIL']);
            $this->db->set('PICCTURE', 'none');
            $this->db->set('TYPE', 'paciente');
            $salt = random_string('unique', 64);
            $this->db->set('SALT', $salt);
            $this->db->set('PASSWORD', hash("sha256", $data['PASSWORD'] . $salt));
            $this->db->set('IP', '0.0.0.0');
            if($this->db->insert('MA_AUTH')) {
                return TRUE;
            }
        }

        function update($data) {

            $this->db->where('ID_USER', $data['ID_USER']);
            $query = $this->db->get('MA_USERS');
            $paciente = $query->row();

            if (!isset($paciente)) {
                # code...
                $respuesta = array(
                    'error' => TRUE,
                    'mensaje' => 'El paciente ID no existe',
                    'http_code' => 400
                );
                return $respuesta;
            }

            $this->db->reset_query();
            $this->db->set('NAME_USER', $data['NAME_USER']);
            $this->db->set('P_LASTNAME', $data['P_LASTNAME']);
            $this->db->set('M_LASTNAME', $data['M_LASTNAME']);
            $this->db->set('PHONE_NUMBER', $data['PHONE_NUMBER']);
            $this->db->set('BIRTHDATE', $data['BIRTHDATE']);
            $this->db->set('GENDER', $data['GENDER']);
            $this->db->set('PLACE_OF_BIRTH', $data['PLACE_OF_BIRTH']);
            $this->db->set('MARITAL_STATUS', $data['MARITAL_STATUS']);
            $this->db->where('ID_USER', $data['ID_USER']);
            
            $hecho = $this->db->update('MA_USERS');
            if ($hecho) {
                $respuesta = array(
                    'error' => FALSE,
                    'mensaje' => 'Paciente actualizado correctamente',
                    'USER_ID' => $data['ID_USER'],
                    'http_code' => 200
                );
            } else {
                $respuesta = array(
                    'error' => TRUE,
                    'mensaje' => 'Error al actualizar paciente',
                    'DB_error' => $this->db->_error_message(),
                    'DB_error_num' => $this->db->_error_number(),
                    'http_code' => 500
                );
            }
            
            return $respuesta;
        }

        function delete($id) {
            $this->db->where('ID_USER', $id);
            $query = $this->db->get('MA_USERS');
            $paciente = $query->row();

            if (!isset($paciente)) {
                # code...
                $respuesta = array(
                    'error' => TRUE,
                    'mensaje' => 'El paciente ID no existe',
                    'http_code' => 400
                );
                return $respuesta;
            }

            $this->db->reset_query();
            $this->db->set('STATUS', 'borrado');
            $this->db->where('ID_USER', $id);

            $hecho = $this->db->update('MA_USERS');

            if ($hecho) {
                # code...
                $respuesta = array(
                    'error' => FALSE,
                    'mensaje' => 'Paciente borrado correctamente'
                );
            } else {
                # code...
                $respuesta = array(
                    'error' => TRUE,
                    'mensaje' => 'Error al eliminar paciente',
                    'DB_error' => $this->db->_error_message(),
                    'DB_error_num' => $this->db->_error_number(),
                    'http_code' => 500
                );
            }
            

            return $respuesta;
        }
    }