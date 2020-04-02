#!/bin/bash
echo "Zum Anfang wird getestet ob zenity installiert ist. Wenn nicht, dann wird es automatisch installiert."

sleep 5

test -f /usr/bin/zenity || sudo apt-get install zenity -y

sudo -k

sleep 1
clear

zenity --question --text="Helligkeit ändern?" --title "Helligkeit"
if [ $? = 0 ]; then
    cd /sys/class/backlight

else
    exit
fi

cd $(zenity --file-selection --directory --title "Helligkeit")
zenity --info --text="Maximale Helligkeit: $(cat max_brightness)" --title "Helligkeit"

PASSW=$(zenity --entry --hide-text --text "Bitte Passwort eingeben:" --title "Helligkeit")
echo -e "$PASSW\n" | sudo -S -s -- echo " "
PASSW=""

sudo su -c "echo $(zenity --entry --text Helligkeit? --title Helligkeit) > $(pwd)/brightness"
zenity --info --text="Credit: https://github.com/PassiHD2004" --title="Credit" --width 250 --height 150
