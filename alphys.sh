#!/bin/bash -x
#title:	alphys
#Date: 31/10/2021
#version: 1.4
#description: reproduz os meus animes e series de forma analoga a uma televisão
# Importando API
	cd /home/player/undercode/alphys/
	echo "$(ls | shuf)" > .alphys.txt 
	while read alphys; do
		[[ "$(ls $alphys | egrep -v '.txt' | egrep -v '.srt')" ]] && {
			cd "$alphys"
			mewmew="$(ls | egrep -v '.txt' | egrep -v '.srt' | head -n1)"
			vlc "$mewmew"
			mv "$mewmew" ".$mewmew"
			cd ..
		} || {
			rm -r $alphys
		}
	done < .alphys.txt
	> .alphys.txt
