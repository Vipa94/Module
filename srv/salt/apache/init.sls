#Original by Tero Karvinen, http://TeroKarvinen.com GPL 3
#http://terokarvinen.com/2018/apache-user-homepages-automatically-salt-package-file-service-example


#This state installs apache

apache2:
  pkg.installed


# Edit Apache2 default page

/var/www/html/index.html:
  file.managed:
    - source: salt://apache/default.html


# Enable users homepage

/etc/apache2/mods-enabled/userdir.conf:
  file.symlink:
    - target: ../mods-available/userdir.conf


/etc/apache2/mods-enabled/userdir.load:
  file.symlink:
    - target: ../mods-available/userdir.load


# Restart apache2 when changes to config files are made

apache2service:
  service.running:
    - name: apache2
    - watch:
      - file: /etc/apache2/mods-enabled/userdir.conf
      - file: /etc/apache2/mods-enabled/userdir.load
