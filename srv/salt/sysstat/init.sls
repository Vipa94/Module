# Made by Vili Viita 2018


# This installs sysstat

sysstat:
  pkg.installed


# Configure files to enable sysstat

/etc/default/sysstat:
  file.managed:
    - source: salt://sysstat/default

# Start sysstat

sysstatservice:
  service.running:
    - name: sysstat
    - watch:
      - file: /etc/default/sysstat
