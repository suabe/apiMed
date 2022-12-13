<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
    require APPPATH.'/libraries/RestController.php';
    require APPPATH . 'libraries/Format.php';
    use chriskacerguis\RestServer\RestController;

    class Pacientes extends RestController {
        function __construct() {
            parent::__construct();
            $this->load->model('pacientes_model');
        }

        public function index_get() {
            $users = $this->pacientes_model->all();
            if (isset($users)) {
                $respuesta = array(
                    'pacientes' => $users,
                    'mensaje' => 'Listado de Pacientes',
                    'error' => false
                );
                $this->response( $respuesta, 200 );
            } else {
                $respuesta = array(
                    'pacientes' => null,
                    'mensaje' => 'No hay Pacientes',
                    'error' => false
                );
                $this->response( $respuesta, 404 );
            }
            
            
        }

        public function paciente_get() {
            $paciente_id = $this->uri->segment(3);
            if (!isset($paciente_id)) {
                $respuesta = array( 
                    'error' => TRUE,
                    'mensaje' => 'Falta Id de paciente'
                );
                $this->response( $respuesta , 400 );
                return;
            }

            $paciente = $this->pacientes_model->detail($paciente_id);
            if (isset($paciente)) {
                $respuesta = array(
                    'error' => false,
                    'mensaje' => 'Paciente encontrado',
                    'paciente' => $paciente
                );
                $this->response( $respuesta , 200 );
            } else {
                $respuesta = array(
                    'error' => true,
                    'mensaje' => 'Paciente no encontrado',
                    'paciente' => null
                );
                $this->response( $respuesta , 404 );
            }
            

            
        }

        public function paciente_put() {
            $data = $this->put();
            $this->form_validation->set_data($data);

            $this->form_validation->set_rules('NAME_USER','Nombre', 'required');
            $this->form_validation->set_rules('P_LASTNAME','Apellido Paterno','required');
            $this->form_validation->set_rules('M_LASTNAME','Apellido Materno','required');
            $this->form_validation->set_rules('EMAIL','Email', 'required|valid_email|is_unique[MA_USERS.EMAIL]');            
            $this->form_validation->set_rules('PASSWORD','Contraseña','required');
            $this->form_validation->set_rules('PHONE_NUMBER','Telefono','required');
            $this->form_validation->set_rules('BIRTHDATE','Cumpleaños','required');
            $this->form_validation->set_rules('GENDER','Genero','required');
            $this->form_validation->set_rules('PLACE_OF_BIRTH','Estado','required');
            $this->form_validation->set_rules('MARITAL_STATUS','Estado Civil','required');

            if ($this->form_validation->run()) {
                # code...
                $respuesta = $this->pacientes_model->create($data);
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

        public function paciente_post( $id = null) {
            $data = $this->post();
            $data['ID_USER'] = $this->uri->segment(3);
            $this->form_validation->set_data($data);

            $this->form_validation->set_rules('ID_USER','Paciente ID', 'required|integer');
            $this->form_validation->set_rules('NAME_USER','Nombre', 'required');
            $this->form_validation->set_rules('P_LASTNAME','Apellido Paterno','required');
            $this->form_validation->set_rules('M_LASTNAME','Apellido Materno','required');                
            $this->form_validation->set_rules('PHONE_NUMBER','Telefono','required');
            $this->form_validation->set_rules('BIRTHDATE','Cumpleaños','required');
            $this->form_validation->set_rules('GENDER','Genero','required');
            $this->form_validation->set_rules('PLACE_OF_BIRTH','Estado','required');
            $this->form_validation->set_rules('MARITAL_STATUS','Estado Civil','required');
            if ($this->form_validation->run()) {
                # code...
                $respuesta = $this->pacientes_model->update($data);
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

        public function paciente_delete( $id = null ) {
            if ($id) {
                # code...
                $respuesta = $this->pacientes_model->delete($id);
                $this->response( $respuesta , 200 );
            } else {
                # code...
                $respuesta = array( 
                    'error' => TRUE,
                    'mensaje' => 'Falta Id de paciente'
                );
                $this->response( $respuesta , 400 );
            }
        }
    }