FROM docker.n8n.io/n8nio/n8n:2.36.9

USER root
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
USER node

ENV N8N_LISTEN_ADDRESS=0.0.0.0
ENV GENERIC_TIMEZONE=America/Sao_Paulo
ENV TZ=America/Sao_Paulo
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

EXPOSE 5678

ENTRYPOINT ["/docker-entrypoint.sh"]
