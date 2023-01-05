<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
    require APPPATH.'/libraries/RestController.php';
    require APPPATH . 'libraries/Format.php';
    use chriskacerguis\RestServer\RestController;

    class Pacientes extends RestController {
        /**
         * @OA\Tag(
         *     name="Pacientes",
         *     description="Metodo para el manejo de Pacientes",
         * )
         * 
         
         * Post   200,201,202,400,404,422
         
         * 
         * 200  OK         
         * 400  Bad Request
         * 401  Unauthorized
         * 404  Not Found
         * 422  Unprocessable Entity
         */
        function __construct() {
            parent::__construct();
            $this->load->model('pacientes_model');
        }

        /**
         * @OA\Get(
         *     path="/pacientes",
         *     tags={"Pacientes"},
         *     deprecated=false,
         *     summary="Lista de pacientes.",
         *     description="Muestra los pacientes registrados.",
         *     operationId="",         
         *     @OA\Response(response="401", description="Unauthorized"),
         *     @OA\Response(response="404", description="Not Found"),
         *     @OA\Response(response=200,description="Success",
         *     @OA\JsonContent(
         *       @OA\Property(property="error", type="boolean"),
         *       @OA\Property(property="mensaje", type="string"),
         *       @OA\Property(property="pacientes", type="array",
         *          @OA\Items(
         *              @OA\Property(property="ID_USER", type="string"),
         *              @OA\Property(property="NAME_USER", type="string"),
         *              @OA\Property(property="P_LASTNAME", type="string"),
         *              @OA\Property(property="M_LASTNAME", type="string"),
         *              @OA\Property(property="EMAIL", type="string"),
         *              @OA\Property(property="PHONE_COUNTRY_PREFIX", type="string"),
         *              @OA\Property(property="PHONE_NUMBER", type="string"),
         *              @OA\Property(property="BIRTHDATE", type="string"),
         *              @OA\Property(property="PROFILE_PICTURE", type="string"),
         *              @OA\Property(property="PS_US", type="string"),
         *              @OA\Property(property="GENDER", type="string"),
         *              @OA\Property(property="E_C_PHONE_CONUTRY_PREFIX", type="string"),
         *              @OA\Property(property="E_C_PHONE_NUMBER", type="string"),
         *              @OA\Property(property="E_C_NAME", type="string"),
         *              @OA\Property(property="PLACE_OF_BIRTH", type="string"),
         *              @OA\Property(property="EMPLOYMENT", type="string"),
         *              @OA\Property(property="MARITAL_STATUS", type="string"),
         *              @OA\Property(property="DYNAMIC_KEY", type="string"),
         *              @OA\Property(property="ID_BILLING_DATA", type="string"),
         *              @OA\Property(property="ID_TYPE_USER", type="string"),
         *              @OA\Property(property="ID_STATE_RECORD", type="string"),
         *              @OA\Property(property="STATUS", type="string"),
         *              @OA\Property(property="ID_SUSPENDED_BY", type="string"),
         *              @OA\Property(property="DATE_RECORD", type="string"),
         *           ) 
         *          )
         *        )
         *     ),
         *     security={{"X-API-KEY": {}}}
         * )
         */
        // 200,400,404,422
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

        /**
         * @OA\Get(
         *     path="/pacientes/paciente/{id}",
         *     tags={"Pacientes"},
         *     deprecated=false,
         *     summary="Detalle paciente",
         *     description="Muestra el detalle de un paciente.",
         *     operationId="",
         *     @OA\Parameter(name="id",in="path",required=true,@OA\Schema(type="string")),
         *     @OA\Response(response="401", description="Unauthorized"),
         *     @OA\Response(response="404", description="Not Found"),
         *     @OA\Response(response=200,description="Success",
         *       @OA\JsonContent(
         *          @OA\Property(property="error", type="boolean"),
         *          @OA\Property(property="mensaje", type="string"),
         *          @OA\Property(property="paciente", type="object", 
         *              @OA\Property(property="ID_USER", type="string"),
         *              @OA\Property(property="NAME_USER", type="string"),
         *              @OA\Property(property="P_LASTNAME", type="string"),
         *              @OA\Property(property="M_LASTNAME", type="string"),
         *              @OA\Property(property="EMAIL", type="string"),
         *              @OA\Property(property="PHONE_COUNTRY_PREFIX", type="string"),
         *              @OA\Property(property="PHONE_NUMBER", type="string"),
         *              @OA\Property(property="BIRTHDATE", type="string"),
         *              @OA\Property(property="PROFILE_PICTURE", type="string"),
         *              @OA\Property(property="PS_US", type="string"),
         *              @OA\Property(property="GENDER", type="string"),
         *              @OA\Property(property="E_C_PHONE_CONUTRY_PREFIX", type="string"),
         *              @OA\Property(property="E_C_PHONE_NUMBER", type="string"),
         *              @OA\Property(property="E_C_NAME", type="string"),
         *              @OA\Property(property="PLACE_OF_BIRTH", type="string"),
         *              @OA\Property(property="EMPLOYMENT", type="string"),
         *              @OA\Property(property="MARITAL_STATUS", type="string"),
         *              @OA\Property(property="DYNAMIC_KEY", type="string"),
         *              @OA\Property(property="ID_BILLING_DATA", type="string"),
         *              @OA\Property(property="ID_TYPE_USER", type="string"),
         *              @OA\Property(property="ID_STATE_RECORD", type="string"),
         *              @OA\Property(property="STATUS", type="string"),
         *              @OA\Property(property="ID_SUSPENDED_BY", type="string"),
         *              @OA\Property(property="DATE_RECORD", type="string"), 
         *          )
         *       )
         *     ),
         *     security={{"X-API-KEY": {}}}
         * )
         */
        // 200,400,404,422
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
        /**
         * @OA\Put(
         *   path="/pacientes/paciente",
         *   tags={"Pacientes"},
         *   deprecated=false,
         *   summary="Crear Paciente",
         *   description="Crea un paciente y devuelve el UID creado.",
         *   operationId="",
         *   @OA\Response(response="401", description="Unauthorized"),
         *   @OA\Response(
         *      response="200", description="Success",
         *      @OA\JsonContent(
         *          @OA\Property(property="error", type="boolean"),
         *          @OA\Property(property="mensaje", type="string"),
         *          @OA\Property(property="USER_ID", type="string"),
         *      ) 
         *   ),
         *   @OA\RequestBody(
         *      required=true,
         *      @OA\MediaType(
         *          mediaType="application/json",
         *          @OA\Schema(
         *              @OA\Property(property="NAME_USER", type="string"),
         *              @OA\Property(property="P_LASTNAME", type="string"),
         *              @OA\Property(property="M_LASTNAME", type="string"),
         *              @OA\Property(property="EMAIL", type="string"),
         *              @OA\Property(property="PASSWORD", type="string"),
         *              @OA\Property(property="PHONE_NUMBER", type="string"),
         *              @OA\Property(property="BIRTHDATE", type="string"),
         *              @OA\Property(property="GENDER", type="string"),
         *              @OA\Property(property="PLACE_OF_BIRTH", type="string"),
         *              @OA\Property(property="MARITAL_STATUS", type="string"),
         *          )
         *      ),
         *   ),
         *   security={{"X-API-KEY": {}}}
         * )
         */
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
        /**
         * @OA\Post(
         *      path="/pacientes/paciente/{id}",
         *      tags={"Pacientes"},
         *      deprecated=false,
         *      summary="Actualizar Paciente",
         *      description="Actualiza los datos de un paciente.",
         *      operationId="",
         *      @OA\Parameter(name="id",in="path",required=true,@OA\Schema(type="string")),
         *      @OA\Response(response="401", description="Unauthorized"),
         *      @OA\Response(
         *          response="200", description="Success",
         *          @OA\JsonContent(
         *              @OA\Property(property="error", type="boolean"),
         *              @OA\Property(property="mensaje", type="string"),
         *              @OA\Property(property="USER_ID", type="string"),
         *          )
         *      ),
         *      @OA\RequestBody(
         *          required=true,
         *          @OA\MediaType(
         *              mediaType="application/json",
         *              @OA\Schema(
         *                  @OA\Property(property="NAME_USER", type="string"),
         *                  @OA\Property(property="P_LASTNAME", type="string"),
         *                  @OA\Property(property="M_LASTNAME", type="string"),
         *                  @OA\Property(property="PHONE_NUMBER", type="string"),
         *                  @OA\Property(property="BIRTHDATE", type="string"),
         *                  @OA\Property(property="GENDER", type="string"),
         *                  @OA\Property(property="PLACE_OF_BIRTH", type="string"),
         *                  @OA\Property(property="MARITAL_STATUS", type="string"),
         *              )
         *          ),
         *      ),
         *      security={{"X-API-KEY": {}}}
         * )
         */
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
        /**
         * @OA\Delete(
         *      path="/pacientes/paciente/{id}",
         *      tags={"Pacientes"},
         *      deprecated=false,
         *      summary="Borrar Paciente",
         *      description="Borra un paciente.",
         *      operationId="",
         *      @OA\Parameter(name="id",in="path",required=true,@OA\Schema(type="string")),
         *      @OA\Response(response="401", description="Unauthorized"),
         *      @OA\Response(
         *          response="200", description="Success",
         *          @OA\JsonContent(
         *              @OA\Property(property="error", type="boolean"),
         *              @OA\Property(property="mensaje", type="string")
         *          )
         *      ),
         *      security={{"X-API-KEY": {}}}
         * )
         */
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