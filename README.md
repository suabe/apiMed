# API Timer Clinic

## Test Running Application

Dockerize Codeigniter App con docker-compose.

* Docker
* CodeIgniter 3
    * Libreria CodeIgniter RestServer
* Ngix 1.23
* MySQL 5.7
* PHP 8.1.13
* phpMyAdmin

```sh
## runing with docker compose
docker-compose -f docker-compose.yml up --build
# or run in background process 
docker-compose -f docker-compose.yml up --build -d
```

app se inicia en el puerto 8181
> Acceder desde [aqui](http://localhost:8181/)


phpmyadmin se inicia en el puerto 8282
```sh
login with username `api_user` and password `92B375652A6FC57C`
```
> Acceder desde [aqui](http://localhost:8282/)
