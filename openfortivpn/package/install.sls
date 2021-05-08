# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "openfortivpn/map.jinja" import openfortivpn with context %}

openfortivpn-prerequisites:
  pkg.installed:
    - pkgs:
      - ppp

openfortivpn-build-prerequisites:
  pkg.installed:
    - pkgs:
      - git
      - gcc
      - automake
      - autoconf
      - {{ openfortivpn.pkg.openssl_devel.name }}
      - make
      - {{ openfortivpn.pkg.pkgconfig.name }}

/opt/openfortivpn-src:
  file.directory:
    - user: {{ pillar['openfortivpn']['build']['username'] }}

https://github.com/adrienverge/openfortivpn.git:
  git.detached:
    - rev: master
    - target: /opt/openfortivpn-src
    - user: {{ pillar['openfortivpn']['build']['username'] }}

openfortivpn-build-and-install:
  cmd.run:
    - name: |
        ./autogen.sh
        ./configure --prefix=/usr/local --sysconfdir=/etc
        make
        sudo make install
    - cwd: /opt/openfortivpn-src
    - runas: {{ pillar['openfortivpn']['build']['username'] }}
