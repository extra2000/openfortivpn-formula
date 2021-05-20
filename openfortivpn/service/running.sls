# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import OPENFORTIVPN with context %}

/openfortivpn-credentials:
  mount.mounted:
    - device: tmpfs
    - fstype: tmpfs
    - opts: size=32K
    - mkmnt: true
    - persist: false

{% if OPENFORTIVPN.use_certificate %}
openfortivpn-crtfile-present:
  file.managed:
    - name: /openfortivpn-credentials/{{ OPENFORTIVPN.certificate.crtfile }}
    - source: salt://openfortivpn/files/secrets/{{ OPENFORTIVPN.certificate.crtfile }}
    - mode: 400
    - force: true
    - require:
      - mount: /openfortivpn-credentials

openfortivpn-keyfile-present:
  file.managed:
    - name: /openfortivpn-credentials/{{ OPENFORTIVPN.certificate.keyfile }}
    - source: salt://openfortivpn/files/secrets/{{ OPENFORTIVPN.certificate.keyfile }}
    - mode: 400
    - force: true
    - require:
      - mount: /openfortivpn-credentials
{% endif %}

openfortivpn-client-service-running:
  service.running:
    - name: openfortivpn@client.service
    - enable: false
    - require:
      - mount: /openfortivpn-credentials
{% if OPENFORTIVPN.use_certificate %}
      - file: openfortivpn-crtfile-present
      - file: openfortivpn-keyfile-present
{% endif %}

{% for src_ipaddr in OPENFORTIVPN.masquerade %}
openfortivpn-nat-rule-{{ loop.index }}-present:
  iptables.append:
    - table: nat
    - chain: POSTROUTING
    - source: {{ src_ipaddr }}
    - jump: MASQUERADE
    - save: false
{% endfor %}

net.ipv4.ip_forward:
  sysctl.present:
    - value: 1
