FROM docker.io/searxng/searxng:latest

USER root

RUN mkdir -p /opt/searxng_config

COPY ./config/settings.yml /opt/searxng_config/settings.yml
COPY ./config/limiter.toml /opt/searxng_config/limiter.toml

RUN chown -R searxng:searxng /opt/searxng_config && \
    chmod -R 755 /opt/searxng_config

USER searxng
