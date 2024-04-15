FROM golang:1.22.2-alpine3.19 as builder

LABEL maintainer="arifhp86@gmail.com"

WORKDIR /usr/src/app

# set necessary build args
ARG CGO_ENABLED=0
ARG GOOS=linux

# install dependencies
COPY go.mod go.sum ./
RUN go mod download

# build
COPY . .
RUN go build -o /usr/local/bin/go_server ./...

# final stage
FROM alpine:3.19
ENV PORT=80
COPY --from=builder /usr/local/bin/go_server /usr/local/bin/go_server
CMD ["go_server"]