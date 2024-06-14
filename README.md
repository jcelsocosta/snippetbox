## SQL
```bash
CREATE TABLE snippets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created DATETIME NOT NULL,
    expires DATETIME NOT NULL
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    hashed_password BLOB NOT NULL,
    created DATETIME NOT NULL
);

CREATE TABLE sessions (
token CHAR(43) PRIMARY KEY,
data BLOB NOT NULL,
expiry TIMESTAMP(6) NOT NULL
);
CREATE INDEX sessions_expiry_idx ON sessions (expiry);

```

- **cmd/web**: Contém o ponto de entrada da aplicação (`main.go`).
- **internal/book**: Contém a lógica.
- **tls/**: Diretório para certificados TLS.
- **ui/**: Diretório para arquivos front-end (HTML, CSS, JS).

## Requisitos

- **Go**: Versão 1.22 ou superior.

## Instalação

### 1. Clone o Repositório

```bash
git clone https://github.com/jcelsocosta/snippetbox.git
cd snippetbox
go run ./cmd/web/

https://localhost:4000
