/etc/skel/public_html/index.html
  file.managed:
     - source: salt://index.html
     - makedirs: True
