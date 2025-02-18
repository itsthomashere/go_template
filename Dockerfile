FROM golang:1.24rc2-alpine3.21 AS build

RUN apk add --no-cache gcc musl-dev
RUN mkdir -p /app
WORKDIR /app 

COPY go.mod go.sum ./

RUN go mod download
COPY . .

RUN GOOS=linux CC=cc go build -C ./cmd  --ldflags '-linkmode external -extldflags "-static"' -tags musl -o /start_app 

EXPOSE ${APP_PORT}

FROM alpine:3.21

WORKDIR /app
COPY --from=build /start_app /app
CMD ["/app/start_app"]
