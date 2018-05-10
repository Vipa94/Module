sysstat:
  pkg.installed


/etc/default/sysstat:
  file.managed:
    - source: salt://sysstat/default


sysstatservice:
  service.running:
    - name: sysstat
    - watch:
      - file: /etc/default/sysstat
