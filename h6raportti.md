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

Tämän jälkeen siirryin live tikulle testaamaan tilaa.
