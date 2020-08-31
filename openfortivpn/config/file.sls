# -*- coding: utf-8 -*-
# vim: ft=sls

openfortivpn-client-conf-present:
  file.managed:
    - name: /etc/openfortivpn/client.conf
    - source: salt://openfortivpn/files/openfortivpn.client.conf.jinja
    - template: jinja
    - force: true
