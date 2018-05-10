# Tämä tehtävä on osa Tero Karvisen Palvelinten hallinta -kurssia
http://terokarvinen.com/2018/aikataulu-%e2%80%93-palvelinten-hallinta-ict4tn022-4-ti-5-ke-5-loppukevat-2018-5p

## a) Kultainen polku. Tee ensimmäinen versio modulistasi, joka toimii ainakin optimiolosuhteissa. Jos jokin säätö on poikkeuksellisen hankala, voit tehdä sen tässä versiossa käsin, ja dokumentoida ajamasi käskyt.

Valitsemani moduuliaihe oli Virtuaalipalvelimen käyttöönotto, ja aloitin moduulin tekemisen Salt osion luomisella.
Saltin kautta moduuli asentaa apachen ja ottaa käyttäjien kotisivut käyttöön, asentaa SSH:n ja muokkaa sshd_config tiedostosta kommentit pois ja asentaa ja ottaa käyttöön sysstatin.
Tässä vaiheessa testasin tilaa bash scriptillä, joka ajaa highstaten lokaalisti:

	local:
	----------
	## Tila testasi kaikki 11 komentoa onnistuneesti, poistin lyhentääkseni tekstiä

	Summary for local
	-------------
	Succeeded: 11
	Failed:     0
	-------------
	Total states run:     11


Salt osuus näyttää toimivan ainakin koneella, jossa kaikki on jo valmiiksi asennettuna.

Loin tämän jälkeen testausta varten bash tiedoston, jossa käytin pohjana Tero Karvisen sirotinta: https://github.com/terokarvinen/sirotin/blob/master/run.sh

	# Original by Tero Karvinen http://TeroKarvinen.com GPL 3
	# GitHub: https://github.com/terokarvinen/sirotin/blob/master/run.sh

	#!/bin/bash


	sudo apt-get update
	sudo apt-get -y install git salt-minion


	echo 'master: localhost'|sudo tee /etc/salt/minion

	git clone https://github.com/Vipa94/Module
	cd Module/

	./module.sh


Tämän jälkeen siirryin live tikulle testaamaan tilaa.

## b) Kokeile moduliasi tyhjässä koneessa. Voit käyttää virtualboxia, vagranttia tai livetikkua.



Aloitin testauksen antamalla komennon:

	wget https://raw.githubusercontent.com/Vipa94/Module/master/test.sh

ja ajamalla kysessä olevan bash skriptin

	bash test.sh

Skripti toimi muuten mainiosti, mutta jostain syystä skriptin lopussa oleva
./module.sh rivi ei ajanut kyseessäolevaa skriptiä, vaan ilmoitti, että oikeuksia tiedostoon ei olisi

Manuaalinen ajo kuitenkin toimi vallan mainiosti, ja tekstiä onnistuneista tapahtumista terminaaliin tuli sivukaupalla. Lopussa tuli vielä ilmoitus, että saltin kautta asennus on onnistunut:

	Summary for local
	-------------
	Succeeded: 11 (changed=11)
	Failed:     0
	-------------
	Total states run:     11

Kaikki asentui niin kuin pitää, joten tässä vaiheessa lienee hyvä hetki alkaa painiskella tuon
./module.sh komennon parissa, ja koittaa saada se automatisoitua

Ratkaisin ongelman muuttamalla rivin muototoon bash module.sh. Kun ajoin test.sh tiedoston muutoksen jälkeen,
meni skripti läpi, ja sain koko homman ajettua kahdella komennolla.

	wget https://raw.githubusercontent.com/Vipa94/Module/master/test.sh
	bash test.sh

Kokeilen asennusta vielä uudestaan tyhjään tikkuun ja lisäämällä test.sh tiedostoon rivin, joka muuttaa näppäimistön suomalaiseksi, lähinnä livetikkua ajatellen.
Uusi yritys, ja tällä kertaa myös tuo module.sh skripti tiedosto ajettiin automaattisesti. Nyt voi alkaa sitten miettimään parannuksia.

	-------------
	Succeeded: 11
	Failed:     0
	-------------
	Total states run:     11


## c) Käyttäjätarina (user story): ketkä ovat modulisi käyttäjät? Mitä he haluavat saada aikaan modulillasi? Missä tilanteessa he sitä käyttävät? Mitkä ovat tärkeimmät parannukset käyttäjän kannalta, joita moduliin pitäisi vielä tehdä? Tähän c-kohtaan vain sanallinen vastaus, tämä kohta ei poikkeuksellisesti edellytä testejä tietokoneella.

Moduuli on ehkä enemmän omaan, kavereiden ja tulevien kolleegojen käyttöön tarkoitettu, sillä tavoitteenani on saada tästä valmis moduuli, joka nopeuttaa ja yksinkertaistaa uuden virtuaalipalvelimen käyttöönottoa.
Lisäksi tilaa voisi käyttää myös live-tikulla, aina kun tilanne sitä vaatii. En ole itse ihan vielä tyytyväinen lopputulokseen, ja yritän vielä kysellä eri henkilöiltä erilaisia ideoita ohjelmien asennuksen ja erilaisten asetusten suhteen. Käyttäjän kannalta moduuli on jo varsin hyvä, sillä se asentaa virtuaalipalvelimen käyttöönottoon ja testaukseen tarvittavia ohjelmistoja. Yritän kuitenkin vielä parannella moduulia parhaan kykyni mukaan.
