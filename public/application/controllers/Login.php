<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
    require APPPATH.'/libraries/RestController.php';
    require APPPATH . 'libraries/Format.php';
    use chriskacerguis\RestServer\RestController;

    class Login extends RestController {
        function __construct() {
            parent::__construct();
            $this->load->model('auth_model');
        }


        public function paciente_post() {
            $data = $this->post();
            $this->form_validation->set_data($data);

            $this->form_validation->set_rules('EMAIL','Email', 'required|valid_email');            
            $this->form_validation->set_rules('PASSWORD','Contraseña','required');

            if ($this->form_validation->run()) {
                # code...
                $respuesta = $this->auth_model->paciente($data);
                $this->response( $respuesta, $respuesta['http_code'] );
            } else {
                # code...
                $respuesta = array( 
                    'error' => TRUE,
                    'mensaje' => 'Hay errores en el envio de datos',
                    'validaciones' => $this->form_validation->get_errores_arreglo()
                );
                $this->response( $respuesta , 400 );
            }
        }

        public function medico_post() {
            $data = $this->post();
            $this->form_validation->set_data($data);

            $this->form_validation->set_rules('EMAIL','Email', 'required|valid_email');            
            $this->form_validation->set_rules('PASSWORD','Contraseña','required');

            if ($this->form_validation->run()) {
                # code...
                $respuesta = $this->auth_model->medico($data);
                $this->response( $respuesta, $respuesta['http_code'] );
            } else {
                # code...
                $respuesta = array( 
                    'error' => TRUE,
                    'mensaje' => 'Hay errores en el envio de datos',
                    'validaciones' => $this->form_validation->get_errores_arreglo()
                );
                $this->response( $respuesta , 400 );
            }
        }
    }