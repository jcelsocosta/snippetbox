# Use uma imagem oficial do Go como imagem base
FROM golang:1.22 AS builder

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o go.mod e go.sum para o diretório de trabalho
COPY go.mod go.sum ./

# Baixe as dependências
RUN go mod tidy

# Copie o código-fonte da aplicação para o diretório de trabalho
COPY . .

# Compile a aplicação
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# Use uma imagem minimalista como base para a aplicação final
FROM alpine:latest

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o binário compilado do builder para a imagem final
COPY --from=builder /app/main .

# Exponha a porta em que a aplicação irá rodar
EXPOSE 4000

# Comando para rodar a aplicação
CMD ["go run ./cmd/web/"]
