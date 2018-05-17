# Made by Vili Viita 2018

# Changing rules

ufw-allow:
  cmd.run:
    - name: 'sudo ufw allow 22/tcp'

ufw2-allow:
  cmd.run:
    - name: 'sudo ufw allow 80/tcp'

#Enable firewall

ufw-enable:
  cmd.run:
    - name: 'sudo ufw --force enable'
