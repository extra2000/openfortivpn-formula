# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import OPENFORTIVPN with context %}

openfortivpn-client-conf-present:
  file.managed:
    - name: /etc/openfortivpn/client.conf
    - source: salt://openfortivpn/files/openfortivpn.client.conf.jinja
    - template: jinja
    - force: true
    - context:
      openfortivpn: {{ OPENFORTIVPN }}
