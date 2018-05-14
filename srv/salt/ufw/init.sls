ufw-allow:
  cmd.run:
    - name: 'ufw allow 22/tcp'

ufw2-allow:
  cmd.run:
    - name: 'ufw allow 80/tcp'

ufw-enable:
  cmd.run:
    - name: 'ufw enable'
