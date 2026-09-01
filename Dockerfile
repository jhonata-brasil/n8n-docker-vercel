FROM public.ecr.aws/docker/library/node:22-bookworm-slim

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates git python3 make g++ \
  && rm -rf /var/lib/apt/lists/*

ENV NODE_ENV=production
RUN npm install -g n8n@2.36.9

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh \
  && mkdir -p /home/node/.n8n \
  && chown node:node /home/node/.n8n /docker-entrypoint.sh

USER node
WORKDIR /home/node

ENV N8N_LISTEN_ADDRESS=0.0.0.0
ENV GENERIC_TIMEZONE=America/Sao_Paulo
ENV TZ=America/Sao_Paulo
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

EXPOSE 5678

ENTRYPOINT ["/docker-entrypoint.sh"]
