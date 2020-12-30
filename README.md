# php_maxdb_docker
Connecting php to maxdb on a docker container

## Orientations
- Configure the connection params on .env file
- Start the PHP container: `$ docker-compose up -d php`  
- Test the connection: `$ docker-compose exec php php /app/odbc_test.php`
