{% from "openjdk/map.jinja" import openjdk with context %}

include:
  - .install
  - .service

openjdk-config:
  file.managed:
    - name: {{ openjdk.conf_file }}
    - source: salt://openjdk/templates/conf.jinja
    - template: jinja
    - watch_in:
      - service: openjdk_service_running
    - require:
      - pkg: openjdk
