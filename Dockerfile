# Usa la imagen oficial como base
FROM docker.io/searxng/searxng:latest

# Cambiamos a root temporalmente para copiar y asignar permisos
USER root

# Copiamos la configuración desde tu repositorio a la ruta absoluta del contenedor
COPY ./config/settings.yml /etc/searxng/settings.yml
COPY ./config/limiter.toml /etc/searxng/limiter.toml

# Aseguramos que el usuario interno 'searxng' sea el dueño de los archivos
RUN chown -R searxng:searxng /etc/searxng/ && \
    chmod -R 755 /etc/searxng/

# Volvemos al usuario sin privilegios por seguridad
USER searxng
