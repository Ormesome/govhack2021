# Docker Config

## .env files
cat sqlserver.env
cat sapassword.env

## spin up a container from the docker-compose.yaml file
docker compose up -d

## check everything created by running
docker network ls
docker volume ls
docker image ls
docker container ls

## connect to SQL using: -
mssql-cli -S localhost,15789 -u SA -P Testing1122 -Q "SELECT @@VERSION"
sqlcmd -S 127.0.0.1,15789 -U SA -P Testing1122 -Q "SELECT @@VERSION"

## blow away the container and custom network
docker compose down
