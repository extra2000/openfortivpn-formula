# -*- coding: utf-8 -*-
# vim: ft=sls

openfortivpn-client-conf-absent:
  file.absent:
    - name: /etc/openfortivpn/client.conf
