{% from "openjdk/map.jinja" import openjdk with context %}

include:
  - .service

openjdk:
  pkg.installed:
    - pkgs: {{ openjdk.pkgs }}
    - require_in:
        - service: openjdk_service_running
