FROM docker.io/searxng/searxng:latest

USER root

# Creamos un settings.yml que abre TODO de raíz
RUN echo 'use_default_settings: true\n\
server:\n\
  secret_key: "Gonzales2026_Key_Secure"\n\
  base_url: "http://84.247.137.97:8123/"\n\
  image_proxy: true\n\
search:\n\
  formats:\n\
    - html\n\
    - json\n\
botdetection:\n\
  ip_limit:\n\
    filter_link_local: true\n\
  internal_auth:\n\
    active: false\n\
ratelimit:\n\
  method: ip\n\
  limit_window: 600\n\
  limit_cnt: 100' > /etc/searxng/settings.yml

# Permisos para que el usuario searxng pueda leerlo
RUN chown searxng:searxng /etc/searxng/settings.yml && chmod 644 /etc/searxng/settings.yml

USER searxng
