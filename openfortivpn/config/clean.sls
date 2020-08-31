# -*- coding: utf-8 -*-
# vim: ft=sls

openfortivpn-crtfile-absent:
  file.absent:
    - name: /srv/{{ pillar['openfortivpn']['certificate']['crtfile'] }}

openfortivpn-keyfile-absent:
  file.absent:
    - name: /srv/{{ pillar['openfortivpn']['certificate']['keyfile'] }}

openfortivpn-client-conf-absent:
  file.absent:
    - name: /etc/openfortivpn/client.conf
