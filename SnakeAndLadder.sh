#! /bin/bash/ -x

echo "WELCOME TO SNAKE AND LADDER SIMULATION"

START=0
WIN_POSITION=100

currentPosition=$START
function rollDice()
{
	faceValue=$(( ($RANDOM%6)+1 ))
}

function playerOptions()
{
	rollDice
	noPlay=0
	ladder=1
	snake=2
	option=$(( RANDOM%3 ))

	case $option in
		$noPlay)
			currentPosition=$currentPosition
			;;
		$ladder)
			currentPosition=$(( $currentPosition+$faceValue ))
			;;
		$snake)
			currentPosition=$(( $currentPostion-$faceValue ))

			if [ $currentPosition -lt $START ]
			then
				currentPosition=$START
			fi
			;;
	esac

}

function winPosition()
{
	playerOptions
	until [ $currentPosition -ge $WIN_POSITION ]
	do
		if [ $(( $currentPosition+$faceValue )) -gt $WIN_POSITION ]
		then
			currentPosition=$currentPosition
		else
			playerOptions
		fi

		echo "Current Position is > "$currentPosition
	done

	echo "Reached Final Position > " $WIN_POSITION
}

winPosition
