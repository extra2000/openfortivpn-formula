# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import OPENFORTIVPN with context %}

openfortivpn-client-service-dead:
  service.dead:
    - name: openfortivpn@client.service
    - enable: false

/openfortivpn-credentials:
  mount.unmounted

openfortivpn-credentials-dir-absent:
  file.absent:
    - name: /openfortivpn-credentials

{% for src_ipaddr in OPENFORTIVPN.masquerade %}
openfortivpn-nat-rule-{{ loop.index }}-absent:
  iptables.delete:
    - table: nat
    - chain: POSTROUTING
    - source: {{ src_ipaddr }}
    - jump: MASQUERADE
    - save: false
{% endfor %}
