# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import OPENFORTIVPN with context %}

openfortivpn-client-conf-absent:
  file.absent:
    - name: /etc/openfortivpn/client.conf
