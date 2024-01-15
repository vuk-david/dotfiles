#!/bin/sh

case $BLOCK_BUTTON in
		1) amixer set Master 5%+ > /dev/null ;;
		2) amixer set Master toggle > /dev/null ;;
		3) amixer set Master 5%- > /dev/null ;;
		4) amixer set Master 1%+ > /dev/null ;;
		5) amixer set Master 1%- > /dev/null ;;
esac

VOLUME_MUTE="🔇"
VOLUME_LOW="🔈"
VOLUME_MID="🔉"
VOLUME_HIGH="🔊"

#VOLUME_HIGH="📢"

SOUND_LEVEL=$(amixer -M get Master | awk -F"[][]" '/%/ { print $2 }' | awk -F"%" 'BEGIN{tot=0; i=0} {i++; tot+=$1} END{printf("%s\n", tot/i) }')
MUTED=$(amixer get Master | awk ' /%/{print ($NF=="[off]" ? 1 : 0); exit;}')

ICON=$VOLUME_MUTE
if [ "$MUTED" = "1" ]
then
    ICON="$VOLUME_MUTE"
else
    if [ "$SOUND_LEVEL" -lt 15 ]
    then
        ICON="$VOLUME_LOW"
    elif [ "$SOUND_LEVEL" -lt 55 ]
    then
        ICON="$VOLUME_MID"
    else
        ICON="$VOLUME_HIGH"
    fi
fi

if [ "$MUTED" = "1" ]
then
    echo " $ICON: MUTE "
else
	echo "$ICON" "$SOUND_LEVEL" | awk '{ printf(" %s: %3s%% \n", $1, $2) }'
fi
