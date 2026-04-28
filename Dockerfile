FROM docker.io/searxng/searxng:latest

USER root

# Creamos una ruta personalizada que no colisione con volúmenes de la imagen base
RUN mkdir -p /opt/searxng_config

# Copiamos tus archivos de configuración
COPY ./config/settings.yml /opt/searxng_config/settings.yml
COPY ./config/limiter.toml /opt/searxng_config/limiter.toml

# Ajuste de permisos para el usuario searxng (UID 1000)
RUN chown -R searxng:searxng /opt/searxng_config && \
    chmod -R 755 /opt/searxng_config

USER searxng
