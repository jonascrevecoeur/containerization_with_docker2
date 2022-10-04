# backend-example-docker

This project is created to help learn docker configurations for backend projects. Student has to figure out how to construct their configuration based on the README. However, there are some additional helpers added in the README and in the exercise description.

# Prerequisites for development

Install [golang](https://golang.org/doc/install) 1.16

# Build project #

Run `go build`. It will generate a binary named "server"

# Test project #

Run tests with `go test ./...`.

# Execute project #

Execute the file e.g. `./server`.

Server accepts the following environment variables:

- `PORT` to choose which port for the application. Default: 8080
- `REQUEST_ORIGIN` to pass an url through the cors check. Default: https://example.com
