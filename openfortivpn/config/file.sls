# -*- coding: utf-8 -*-
# vim: ft=sls

openfortivpn-crtfile-present:
  file.managed:
    - name: /srv/{{ pillar['openfortivpn']['certificate']['crtfile'] }}
    - source: salt://openfortivpn/files/secrets/{{ pillar['openfortivpn']['certificate']['crtfile'] }}
    - mode: 400
    - force: true

openfortivpn-keyfile-present:
  file.managed:
    - name: /srv/{{ pillar['openfortivpn']['certificate']['keyfile'] }}
    - source: salt://openfortivpn/files/secrets/{{ pillar['openfortivpn']['certificate']['keyfile'] }}
    - mode: 400
    - force: true

openfortivpn-client-conf-present:
  file.managed:
    - name: /etc/openfortivpn/client.conf
    - source: salt://openfortivpn/files/openfortivpn.client.conf.jinja
    - template: jinja
    - force: true
