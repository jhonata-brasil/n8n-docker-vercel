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

A imagem é montada com Node 22 do Amazon ECR (`public.ecr.aws`) e `n8n@2.36.9` via npm, para não bater no limite de pull anônimo do Docker Hub.

O arquivo `Dockerfile.vercel` existe só para a Vercel detectar a imagem. **Não use isso como n8n de produção.**

## Render (recomendado neste projeto)

Abra este link, conecte o GitHub e clique em **Apply**:

[https://render.com/deploy?repo=https://github.com/jhonata-brasil/n8n-docker-vercel](https://render.com/deploy?repo=https://github.com/jhonata-brasil/n8n-docker-vercel)

Use a branch `setup-n8n`. O arquivo `render.yaml` cria o n8n (plano free) e um Postgres free.

Limites do plano gratuito:

- o site dorme depois de uns 15 minutos sem acesso
- o primeiro acesso depois disso pode demorar 1 minuto
- webhook e agenda podem falhar enquanto o serviço está dormindo
- o banco free some em 30 dias

Depois do deploy, abra a URL `*.onrender.com` e crie o primeiro usuário do n8n.
