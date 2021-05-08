# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import OPENFORTIVPN with context %}

openfortivpn-absent:
  cmd.run:
    - name: sudo make uninstall
    - cwd: /opt/openfortivpn-src
    - runas: {{ OPENFORTIVPN.build.username }}

openfortivpn-src-absent:
  file.absent:
    - name: /opt/openfortivpn-src
