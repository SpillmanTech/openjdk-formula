{% from "openjdk/map.jinja" import openjdk with context %}

{% for pkg in openjdk.pkgs %}
test_{{pkg}}_is_installed:
  testinfra.package:
    - name: {{ pkg }}
    - is_installed: True
{% endfor %}
