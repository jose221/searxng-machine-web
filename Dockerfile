FROM docker.io/searxng/searxng:latest

USER root

# Usamos un bloque cat <<EOF para asegurar que el formato sea YAML válido
RUN cat <<EOF > /etc/searxng/settings.yml
use_default_settings: true
server:
  base_url: http://84.247.137.97:8123/
  secret_key: "Gonzales2026_Key_Secure"
  image_proxy: true
search:
  formats:
    - html
    - json
engines:
  - name: wikidata
    disabled: true
  - name: ahmia
    disabled: true
  - name: torch
    disabled: true
botdetection:
  ip_limit:
    filter_link_local: true
  internal_auth:
    active: false
ratelimit:
  method: ip
  limit_window: 600
  limit_cnt: 100
EOF

RUN chown searxng:searxng /etc/searxng/settings.yml && chmod 644 /etc/searxng/settings.yml

USER searxng
