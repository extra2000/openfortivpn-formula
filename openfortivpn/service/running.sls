# -*- coding: utf-8 -*-
# vim: ft=sls

openfortivpn-client-service-running:
  service.running:
    - name: openfortivpn@client.service
    - enable: true
