<?php
    defined('BASEPATH') OR exit('No direct script access allowed');

    class Medicos_model extends CI_Model {
        public function __construct() {
            parent::__construct();
            //Codeigniter : Write Less Do More
        }

        function all() {
            $query = $this->db->get_where('MA_DOCTORS',array('STATUS' => 'activo'));
            return $query->result_array();
        }

        function detail($id) {
            $query = $this->db->get_where('MA_DOCTORS',array('ID_DOCTOR' => $id, 'STATUS' => 'activo' ));
            return $query->row_array();
        }
    }