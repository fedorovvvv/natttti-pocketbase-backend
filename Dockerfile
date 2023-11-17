FROM golang:1.21.4 as build

WORKDIR /app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY go.mod go.sum ./
RUN go mod download && go mod verify


# Build
COPY . .
WORKDIR /
RUN CGO_ENABLED=0 go build -C /app -o /build

FROM alpine:latest
COPY --from=build /build /natttti-pocketbase-backend

EXPOSE 8090

CMD [ "/natttti-pocketbase-backend", "serve", "--http=0.0.0.0:8090", "--dir=/app/data/pb_data", "--publicDir=/app/data/pb_public" ]


# ADD https://github.com/pocketbase/pocketbase/releases/download/v${POCKETBASE_VERSION}/pocketbase_${POCKETBASE_VERSION}_linux_amd64.zip /app/pocketbase/pocketbase.zip

# RUN unzip /app/pocketbase/pocketbase.zip -d /app/pocketbase && \
#     chmod +x /app/pocketbase/pocketbase && \
#     rm /app/pocketbase/pocketbase.zip

# EXPOSE 8090

# CMD [ "/app/pocketbase/pocketbase", "serve", "--http=0.0.0.0:8090", "--dir=/app/data/pb_data", "--publicDir=/app/data/pb_public" ]