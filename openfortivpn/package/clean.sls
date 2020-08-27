# -*- coding: utf-8 -*-
# vim: ft=sls

openfortivpn-absent:
  cmd.run:
    - name: sudo make uninstall
    - cwd: /opt/openfortivpn-src
    - runas: {{ pillar['openfortivpn']['build']['username'] }}

openfortivpn-src-absent:
  file.absent:
    - name: /opt/openfortivpn-src
