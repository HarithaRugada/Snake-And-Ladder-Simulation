#! /bin/bash/ -x

echo "WELCOME TO SNAKE AND LADDER SIMULATION"

START=0

function rollDice()
{
	faceValue=$(( ($RANDOM%6)+1 ))
	echo "The obtained value on the dice is > " $faceValue
}

function playerOptions()
{
	rollDice
	currentPosition=$START
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

	echo "Current Position is > " $currentPosition
}

playerOptions
