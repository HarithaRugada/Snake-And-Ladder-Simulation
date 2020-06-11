#!/bin/bash -x

echo "WELCOME TO SNAKE AND LADDER SIMULATION"

START=0
WIN_POSITION=100

currentPosition=$START
diceRolled=0

function rollDice()
{
	faceValue=$(( ($RANDOM%6)+1 ))
	diceRolled=$(( $diceRolled+1 ))
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
			echo "NO MOVEMENT"
			;;
		$ladder)
			currentPosition=$(( $currentPosition+$faceValue ))
			echo "LADDER"

			if [ $currentPosition -gt $WIN_POSITION ]
			then
				currentPosition=$(( $currentPosition-$faceValue ))
			fi
			;;
		$snake)
			currentPosition=$(( $currentPosition-$faceValue ))

			if [ $currentPosition -lt $START ]
			then
				currentPosition=$START
			fi

			echo "SNAKE"
			;;
	esac

}

function winPosition()
{
	while [ $currentPosition -lt $WIN_POSITION ]
	do
		playerOptions

		if [ $currentPosition -eq $WIN_POSITION ]
		then
			currentPosition=$WIN_POSITION
		fi

	echo "Current Position is > "$currentPosition
	done

	echo "WON THE GAME and Reached Final Position > " $WIN_POSITION
	echo "Number of times the dice rolled > " $diceRolled
}

winPosition
