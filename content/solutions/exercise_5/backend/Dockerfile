FROM golang:1.16

# Copy source files
COPY . /app

# Change to right workdir
WORKDIR /app

# Build the project
RUN go build

# Execute the server
CMD ["./server"]