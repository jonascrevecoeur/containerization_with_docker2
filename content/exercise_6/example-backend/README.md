# backend-example-docker

This is a simple backend in Go for a simple frontend app.

# Prerequisites for development

Install [golang](https://golang.org/doc/install) 1.16

# Build project #

To build the project, run:

```
go build
``` 

It will generate a binary named "server".

# Test project #

Run tests with: 
```
go test ./...
```

# Execute project #

Execute the binary:
```
./server
```

The server accepts the following environment variables:

- `PORT` to choose which port for the application. Default: 8080