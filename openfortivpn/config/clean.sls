# -*- coding: utf-8 -*-
# vim: ft=sls

openfortivpn-crtfile-absent:
  file.managed:
    - name: /srv/{{ pillar['openfortivpn']['certificate']['crtfile'] }}

openfortivpn-keyfile-absent:
  file.managed:
    - name: /srv/{{ pillar['openfortivpn']['certificate']['keyfile'] }}

openfortivpn-systemd-script-absent:
  file.managed:
    - name: /lib/systemd/system/openfortivpn.service

systemd-reload:
  cmd.run:
   - name: systemctl daemon-reload
   - onchanges:
     - file: /lib/systemd/system/openfortivpn.service
