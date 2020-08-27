# -*- coding: utf-8 -*-
# vim: ft=sls

openfortivpn-client-service-dead:
  service.dead:
    - name: openfortivpn@client.service
    - enable: false
