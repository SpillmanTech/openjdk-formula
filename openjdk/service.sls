{% from "openjdk/map.jinja" import openjdk with context %}

openjdk_service_running:
  service.running:
    - name: {{ openjdk.service }}
    - enable: True
