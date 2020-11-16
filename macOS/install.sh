#!/bin/bash
RekordboxDir="$1"

if [ "$USER" != 'root' ]; then
    echo "This program must be run as root. Exiting..."
    exit 3
fi

if [ -z "${RekordboxDir}" ]
then
      RekordboxDir='/Applications/rekordbox 6/rekordbox.app/Contents/Resources/skins'
fi
echo "Using folder ** ${RekordboxDir} **"

if [ -d "$RekordboxDir" ]; then

#Copying new icons

while true; do
        read -p "Do you wish to copy the new icons to ** ${RekordboxDir} **?" yn
        case $yn in
            [Yy]* ) cp -R ../iconpack/ ~/temp; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done


#Applying new signatures
    while true; do
        read -p "Do you wish to force the new signatures in ** ${RekordboxDir} **?" yn
        case $yn in
            [Yy]* ) echo "Forcing signatures in ** ${RekordboxDir} **..."; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done

    echo ""


  #echo 'Forcing blablabla'
  echo "codesign --force --deep --sign - $RekordboxDir"
else
  ###  Control will jump here if $RekordboxDir does NOT exists ###
  echo "Error: $RekordboxDir not found. Can not continue."
  exit 1
fi