# Tämä tehtävä on osa Tero Karvisen Palvelinten hallinta -kurssia
http://terokarvinen.com/2018/aikataulu-%e2%80%93-palvelinten-hallinta-ict4tn022-4-ti-5-ke-5-loppukevat-2018-5p

## a) Kultainen polku. Tee ensimmäinen versio modulistasi, joka toimii ainakin optimiolosuhteissa. Jos jokin säätö on poikkeuksellisen hankala, voit tehdä sen tässä versiossa käsin, ja dokumentoida ajamasi käskyt.

Valitsemani moduuliaihe oli Virtuaalipalvelimen käyttöönotto, ja aloitin moduulin tekemisen Salt osion luomisella.
Saltin kautta moduuli asentaa apachen ja ottaa käyttäjien kotisivut käyttöön, asentaa SSH:n ja muokkaa sshd_config tiedostosta kommentit pois ja asentaa ja ottaa käyttöön sysstatin.
Tässä vaiheessa testasin tilaa bash scriptillä, joka ajaa highstaten locaalisti:

	local:
	----------
	ID: apache2
	Function: pkg.installed
	Result: True
	Comment: Package apache2 is already installed
	Started: 10:54:36.582764
	Duration: 492.045 ms
	Changes:   
	----------
	ID: /var/www/html/index.html
	Function: file.managed
	Result: True
	Comment: File /var/www/html/index.html is in the correct state
	Started: 10:54:37.076335
	Duration: 1.799 ms
	Changes:   
	----------
	ID: /etc/apache2/mods-enabled/userdir.conf
	Function: file.symlink
	Result: True
	Comment: Symlink /etc/apache2/mods-enabled/userdir.conf is present and owned by root:root
	Started: 10:54:37.078342
	Duration: 1.362 ms
	Changes:   
	----------
	ID: /etc/apache2/mods-enabled/userdir.load
	Function: file.symlink
	Result: True
	Comment: Symlink /etc/apache2/mods-enabled/userdir.load is present and owned by root:root
	Started: 10:54:37.079875
	Duration: 1.14 ms
	Changes:   
	----------
	ID: apache2service
	Function: service.running
	Name: apache2
	Result: True
	Comment: The service apache2 is already running
	Started: 10:54:37.082112
	Duration: 33.412 ms
	Changes:   
	----------
	ID: ssh
	Function: pkg.installed
	Result: True
	Comment: Package ssh is already installed
	Started: 10:54:37.115980
	Duration: 8.378 ms
	Changes:   
	----------
	ID: /etc/ssh/sshd_config
	Function: file.managed
	Result: True
	Comment: File /etc/ssh/sshd_config is in the correct state
	Started: 10:54:37.124729
	Duration: 2.638 ms
	Changes:   
	----------
	ID: sshd
	Function: service.running
	Result: True
	Comment: The service sshd is already running
	Started: 10:54:37.128326
	Duration: 34.136 ms
	Changes:   
	----------
	ID: sysstat
	Function: pkg.installed
	Result: True
	Comment: Package sysstat is already installed
	Started: 10:54:37.162869
	Duration: 7.958 ms
	Changes:   
	----------
	ID: /etc/default/sysstat
	Function: file.managed
	Result: True
	Comment: File /etc/default/sysstat is in the correct state
	Started: 10:54:37.171046
	Duration: 1.597 ms
	Changes:   
	----------
	ID: sysstatservice
	Function: service.running
	Name: sysstat
	Result: True
	Comment: The service sysstat is already running
	Started: 10:54:37.173196
	Duration: 35.047 ms
	Changes:   

	Summary for local
	-------------
	Succeeded: 11
	Failed:     0
	-------------
	Total states run:     11


Salt osuus näyttää toimivan ainakin koneella, jossa kaikki on jo valmiiksi asennettuna.

