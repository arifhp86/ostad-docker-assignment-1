## Building the image
After writing the dockerfile, I built the image using the following command:
```bash
docker build -t arifhp86/go .
```
`-t arifhp86/go` is used to tag the image with the name `arifhp86/go`

## Size difference between the single and multi-stage builds
- The size of the image built using the single-stage build is 402 MB
- The size of the image built using the multi-stage build is 15.6 MB

## Reason for the size difference
- In the multi-stage build we are using a smaller base image `alpine:3.19` which is less than 5 MB in size as compared to the base image `golang:1.22.2-alpine3.19` which is around 70 MB in size.
- Another reason for the size difference is that in the multi-stage build we are copying only the executable file from the build stage to the final stage. This means that the final image does not contain any unnecessary files or dependencies that are present in the build stage.

## Running the container
I ran the container using the following command:
```bash
docker run --rm -d -p 8080:80 arifhp86/go
```
- `--rm` is used to remove the container after it is stopped
- `-d` is used to run the container in detached mode
- `-p 8080:80` is used to map port 8080 of the host machine to port 80 of the container
