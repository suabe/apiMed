<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
    require APPPATH.'/libraries/RestController.php';
    require APPPATH . 'libraries/Format.php';
    use chriskacerguis\RestServer\RestController;

    class Medicos extends RestController {
        function __construct() {
            parent::__construct();
            $this->load->model('medicos_model');
        }

        public function index_get() {
            $users = $this->medicos_model->all();
            if (isset($users)) {
                $respuesta = array(
                    'medicos' => $users,
                    'mensaje' => 'Listado de medicos',
                    'error' => false
                );
                $this->response( $respuesta, 200 );
            } else {
                $respuesta = array(
                    'medicos' => null,
                    'mensaje' => 'No hay medicos',
                    'error' => false
                );
                $this->response( $respuesta, 404 );
            }
            
            
        }

        public function medico_get() {
            $medico_id = $this->uri->segment(3);
            if (!isset($medico_id)) {
                $respuesta = array( 
                    'error' => TRUE,
                    'mensaje' => 'Falta Id de medico'
                );
                $this->response( $respuesta , 400 );
                return;
            }

            $medico = $this->medicos_model->detail($medico_id);
            if (isset($medico)) {
                $respuesta = array(
                    'error' => false,
                    'mensaje' => 'medico encontrado',
                    'medico' => $medico
                );
                $this->response( $respuesta , 200 );
            } else {
                $respuesta = array(
                    'error' => true,
                    'mensaje' => 'medico no encontrado',
                    'medico' => null
                );
                $this->response( $respuesta , 404 );
            }
            

            
        }


    }