<?php
    defined('BASEPATH') OR exit('No direct script access allowed');
    require APPPATH.'/libraries/RestController.php';
    require APPPATH . 'libraries/Format.php';
    use chriskacerguis\RestServer\RestController;

    class Login extends RestController {
        /**
         * @OA\Tag(
         *     name="Login",
         *     description="Metodo de Login para Pacientes y Medicos",
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
            $this->load->model('auth_model');
        }

        /**
        * @OA\Post(
        *    path="/login/paciente",
        *    tags={"Login"},
        *    summary="Login Pacientes",
        *    description="Metodo solo para login de usuarios Pacientes.",         
        *    @OA\Response(response="200", description="Success",
        *       @OA\JsonContent(
        *           @OA\Property(property="error", type="boolean"),
        *           @OA\Property(property="mensaje", type="string"),
        *           @OA\Property(property="token", type="string"),
        *           @OA\Property(property="data", type="object", 
        *               @OA\Property(property="NAME_USER", type="string"),
        *               @OA\Property(property="P_LASTNAME", type="string"),
        *               @OA\Property(property="M_LASTNAME", type="string"),
        *               @OA\Property(property="EMAIL", type="string"),
        *               @OA\Property(property="DYNAMIC_KEY", type="string"),
        *               @OA\Property(property="STATUS", type="string"),
        *           ),
        *    )),
        *    @OA\Response(response="403", description="Forbidden"),
        *    @OA\Response(response="404", description="Not Found"),
        *    @OA\RequestBody(
        *      required=true,
        *      @OA\MediaType(mediaType="application/json",
        *       @OA\Schema(
        *          @OA\Property(property="EMAIL",description="Login Email.",type="string"),
        *          @OA\Property(property="PASSWORD",description="Login Password.",type="string"),
        *        ),
        *       ),
        *      ),
        *    security={{"X-API-KEY": {}}},
        * )
        */
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

        /**
        * @OA\Post(
        *    path="/login/medico",
        *    tags={"Login"},
        *    summary="Login Medicos",
        *    description="Metodo solo para login de usuarios Medicos.",         
        *    @OA\Response(response="200", description="Success",
        *       @OA\JsonContent(
        *           @OA\Property(property="error", type="boolean"),
        *           @OA\Property(property="mensaje", type="string"),
        *           @OA\Property(property="token", type="string"),
        *           @OA\Property(property="data", type="object", 
        *               @OA\Property(property="DOCTOR_NAME", type="string"),
        *               @OA\Property(property="DOCTOR_P_LASTNAME", type="string"),
        *               @OA\Property(property="DOCTOR_M_LASTNAME", type="string"),
        *               @OA\Property(property="DOCTOR_EMAIL", type="string"),
        *               @OA\Property(property="DYNAMIC_KEY", type="string"),
        *               @OA\Property(property="STATUS", type="string"),
        *           ),
        *    )),
        *    @OA\Response(response="403", description="Forbidden"),
        *    @OA\Response(response="404", description="Not Found"),
        *    @OA\RequestBody(
        *      required=true,
        *      @OA\MediaType(mediaType="application/json",
        *       @OA\Schema(
        *          @OA\Property(property="EMAIL",description="Login Email.",type="string"),
        *          @OA\Property(property="PASSWORD",description="Login Password.",type="string"),
        *        ),
        *       ),
        *      ),
        *    security={{"X-API-KEY": {}}},
        * )
        */

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