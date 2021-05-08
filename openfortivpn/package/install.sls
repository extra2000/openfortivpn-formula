# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import OPENFORTIVPN with context %}

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
      - {{ OPENFORTIVPN.pkg.openssl_devel.name }}
      - make
      - {{ OPENFORTIVPN.pkg.pkgconfig.name }}

/opt/openfortivpn-src:
  file.directory:
    - user: {{ OPENFORTIVPN.build.username }}

https://github.com/adrienverge/openfortivpn.git:
  git.detached:
    - rev: master
    - target: /opt/openfortivpn-src
    - user: {{ OPENFORTIVPN.build.username }}

openfortivpn-build-and-install:
  cmd.run:
    - name: |
        ./autogen.sh
        ./configure --prefix=/usr/local --sysconfdir=/etc
        make
        sudo make install
    - cwd: /opt/openfortivpn-src
    - runas: {{ OPENFORTIVPN.build.username }}
