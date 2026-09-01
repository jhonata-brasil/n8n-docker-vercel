# n8n com Docker

Projeto para subir o n8n com a imagem oficial em container.

## O que funciona de verdade

O n8n precisa de um processo ligado o tempo todo, disco persistente e webhooks estáveis.

Use Docker localmente ou um host de containers (Railway, Render, Fly.io, VPS).

## Como rodar no seu computador

1. Instale o [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. Copie o arquivo de exemplo de ambiente:

```bash
cp .env.example .env
```

3. Suba o container:

```bash
docker compose up --build
```

4. Abra [http://localhost:5678](http://localhost:5678).

## GitHub

Repositório criado para versionar o Dockerfile, o Compose e o ponto de entrada da imagem.

## Vercel

A Vercel **não é um host de Docker persistente**. Ela empacota a imagem como função HTTP:

- desliga o container depois de uns minutos sem tráfego
- não guarda arquivos do n8n no disco
- quebra agendamentos, filas e execuções longas
- webhooks e o editor tendem a falhar

Imagem base: `docker.n8n.io/n8nio/n8n:2.36.9` (linha estável recente).

O arquivo `Dockerfile.vercel` existe só para a Vercel detectar a imagem. **Não use isso como n8n de produção.**

Para um n8n estável, faça o deploy deste mesmo repositório em Railway, Render, Fly.io ou em um VPS com `docker compose up -d`.
