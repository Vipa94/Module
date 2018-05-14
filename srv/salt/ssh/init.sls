# Made by Vili Viita 2018


# This installs ssh


ssh:
  pkg.installed

# Configuring file

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://ssh/sshd_config

# Restart ssh if changes are made to config file
 
sshd:
  service.running:
    - watch:
      - file: /etc/ssh/sshd_config
