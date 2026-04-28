FROM docker.io/searxng/searxng:latest

USER root

# Creamos una carpeta segura fuera del alcance del volumen por defecto
RUN mkdir -p /custom_config

# Copiamos tus archivos ahí
COPY ./config/settings.yml /custom_config/settings.yml
COPY ./config/limiter.toml /custom_config/limiter.toml

# Permisos para el usuario interno
RUN chown -R searxng:searxng /custom_config/ && \
    chmod -R 755 /custom_config/

USER searxng
