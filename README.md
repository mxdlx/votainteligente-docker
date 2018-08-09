# Test de [VotaInteligente](https://github.com/ciudadanointeligente/votainteligente-portal-electoral) en Docker

Este repositorio contiene un deploy con [docker-compose](https://docs.docker.com/compose/) de [VotaInteligente](https://github.com/ciudadanointeligente/votainteligente-portal-electoral) a modo de entorno de desarrollo local.

### Pasos a seguir
1. Lo primero es clonar este repositorio.
   
   `$ git clone https://github.com/mxdlx/mxdlx/votainteligente-docker`

2. Luego cambiar al directorio de trabajo y levantar el compose.
   
   `$ cd votainteligente-docker && sudo docker-compose up -d`
3. El código de [VotaInteligente](https://github.com/ciudadanointeligente/votainteligente-portal-electoral) se encontrará dentro del directorio `code` una vez finalizado el `docker-compose up`. Es decir, la estructura será de la siguiente forma:
   
```
$ tree -L 1 .
.
├── code
├── docker-compose.yml
├── docker-vi
└── README.md
```

### Rutas disponibles

El `docker-compose` está configurado para que la aplicación escuche en el host en `http://127.0.0.1:8000`. De esta forma hay dos rutas principales:

* `http://127.0.0.1:8000/`: la aplicación en si.
* `http://127.0.0.1:8000/admin`: panel de administración.

#### Panel de administración
En el archivo utilizado como `ENTRYPOINT` del contenedor se define un usuario administrador para la aplicación:

* Usuario: admin
* Password: admin