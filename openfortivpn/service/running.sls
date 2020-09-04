# -*- coding: utf-8 -*-
# vim: ft=sls

/openfortivpn-credentials:
  mount.mounted:
    - device: tmpfs
    - fstype: tmpfs
    - opts: size=32K
    - mkmnt: true
    - persist: false

openfortivpn-crtfile-present:
  file.managed:
    - name: /openfortivpn-credentials/{{ pillar['openfortivpn']['certificate']['crtfile'] }}
    - source: salt://openfortivpn/files/secrets/{{ pillar['openfortivpn']['certificate']['crtfile'] }}
    - mode: 400
    - force: true
    - require:
      - mount: /openfortivpn-credentials

openfortivpn-keyfile-present:
  file.managed:
    - name: /openfortivpn-credentials/{{ pillar['openfortivpn']['certificate']['keyfile'] }}
    - source: salt://openfortivpn/files/secrets/{{ pillar['openfortivpn']['certificate']['keyfile'] }}
    - mode: 400
    - force: true
    - require:
      - mount: /openfortivpn-credentials

openfortivpn-client-service-running:
  service.running:
    - name: openfortivpn@client.service
    - enable: false
    - require:
      - mount: /openfortivpn-credentials
      - file: openfortivpn-crtfile-present
      - file: openfortivpn-keyfile-present

{% for src_ipaddr in salt['pillar.get']('openfortivpn:masquerade') %}
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
