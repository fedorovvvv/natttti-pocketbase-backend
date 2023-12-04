# Natttti PocketBase

## Run

+ Install GO [download](https://go.dev/doc/install) (or use Docker)
+ (OPTIONAl. DO NOT USE) To init the dependencies, run `go mod init natttti-pocketbase-backend && go mod tidy` (OPTIONAl. DO NOT USE)
+ Install dependencies `go mod download && go mod verify`

### Dev

+ To start the application, run `go run main.go serve --encryptionEnv=PB_ENCRYPTION_KEY`

### Build

+ To build a statically linked executable, you can run `CGO_ENABLED=0 go build`
+ And then start the created executable with `./natttti-pocketbase-backend serve`

### Docker

+ Compose `docker compose -f "docker-compose.yaml" up -d --build`

Будет создан **Volume**: `natttti-pocketbase-volume`  
*TODO: Его бы потом синхронить с удалённым сервером и хранить тоже там*


## Links
+ [PocketBase](https://github.com/pocketbase/pocketbase)
