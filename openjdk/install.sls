{% from "openjdk/map.jinja" import openjdk with context %}

openjdk:
  pkg.installed:
    - pkgs: {{ openjdk.pkgs }}
