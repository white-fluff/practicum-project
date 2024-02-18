### Builder ###
FROM golang:1.18-alpine as builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o main ./cmd/api

### Release ###
FROM alpine:3.18.5  
WORKDIR /
COPY --from=builder /app/main .
EXPOSE 8081
CMD ["./main"]