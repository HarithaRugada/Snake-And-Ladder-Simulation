#! /bin/bash/ -x

echo "WELCOME TO SNAKE AND LADDER SIMULATION"

START=0

function rollDice()
{
	faceValue=$(( $RANDOM%6 ))
	echo "The obtained value on the dice is > " $(( $faceValue+1 ))
}

rollDice
