{% from "openjdk/map.jinja" import openjdk with context %}
{#
V10:
linux/x64:   https://download.java.net/java/GA/jdk10/10.0.2/19aef61b38124481863b1413dce1855f/13/openjdk-10.0.2_linux-x64_bin.tar.gz
             https://download.java.net/java/GA/jdk10/10.0.2/19aef61b38124481863b1413dce1855f/13/openjdk-10.0.2_linux-x64_bin.tar.gz.sha256
macOS/x64:   https://download.java.net/java/GA/jdk10/10.0.2/19aef61b38124481863b1413dce1855f/13/openjdk-10.0.2_osx-x64_bin.tar.gz
             https://download.java.net/java/GA/jdk10/10.0.2/19aef61b38124481863b1413dce1855f/13/openjdk-10.0.2_osx-x64_bin.tar.gz.sha256
windows/x64: https://download.java.net/java/GA/jdk10/10.0.2/19aef61b38124481863b1413dce1855f/13/openjdk-10.0.2_windows-x64_bin.tar.gz
             https://download.java.net/java/GA/jdk10/10.0.2/19aef61b38124481863b1413dce1855f/13/openjdk-10.0.2_windows-x64_bin.tar.gz.sha256

V11:
linux/x64:   https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz
             https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz.sha256
macOS/x64:   https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_osx-x64_bin.tar.gz
             https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_osx-x64_bin.tar.gz.sha256
windows/x64: https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_windows-x64_bin.zip
             https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_windows-x64_bin.zip.sha256

#}

{% if openjdk.version <= 8 %}
openjdk:
  pkg.installed:
    - pkgs: {{ openjdk.pkgs }}

{% else %}
{% set openjdk_file = 'openjdk-' ~ openjdk.version ~ '.' ~ openjdk.release ~ '_linux-x64_bin.tar.gz' %}
{% if openjdk.version >= 9 and openjdk.version <= 10 %}
{% set openjdk_url = 'https://download.java.net/java/GA/jdk' ~ openjdk.version ~ '/' ~ openjdk.version ~ '.' ~ openjdk.release ~ '/' ~ openjdk.hash ~ '/' ~ openjdk.build %}
{% else %}
{% set openjdk_url = 'https://download.java.net/java/GA/jdk' ~ openjdk.version ~ '/' ~ openjdk.build ~ '/' ~ openjdk.license %}
{% endif %}

openjdk:
  archive.extracted:
    - name: {{ openjdk.java_real_base }}
    - source: {{ openjdk_url }}/{{ openjdk_file }}
    - source_hash: {{ openjdk_url }}/{{ openjdk_file }}.sha256
    - options: zxvf

include:
  - .env

{% endif %}
