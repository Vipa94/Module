# Made by Vili Viita 2018

/etc/skel/public_html/index.html:
  file.managed:
     - source: salt://index.html
     - makedirs: True
