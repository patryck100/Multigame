#!/bin/bash

# A three in one game

# Game definitions

guess() {
	local -i myNumber=$(( 1 + $RANDOM % 10))
	read -p "I am thinking about a number from 1 to 10. What do you 
think it is? " theGuess
	if ((theGuess == myNumber)); then
		echo "You guessed it right! Well done!"; echo
	else
		echo "Nope. I was actually thinking about number 
$myNumber. Try again!"; echo
	fi
	sleep 1
	chooseGame
}

flip() {
        local -i myNumber=$(( 1 + $RANDOM % 2))
        if ((myNumber == 1)); then
                local face="Heads"
        else
                local face="Tails"
        fi 
	printf "I flipped a coin and it was: %s\n\n" $face
        sleep 1
        chooseGame
}

dice() {
	local -i myNumber=$(( 1 + $RANDOM % 6))
	local -i myNumber2=$(( 1 + $RANDOM % 6))
	printf "I rolled two dice and the results are: %s and %s.\n\n" $myNumber $myNumber2
	sleep 1   
        chooseGame
}

# The game chooser

chooseGame() {
	select game in "Guessing Game" "Flip a coin" "Dice Roll" "Exit"
	do
		case $game in
			"Guessing Game") guess;;
			"Flip a coin") flip;; 
			"Dice Roll") dice;;
			"Exit") exit;;
			*) echo "Please choose from menu.";;
		esac
	done
}
# If a argument is provided

case $1 in
	"guess") guess;;
	"flip") flip;;
	"dice") dice;;
	*) chooseGame;;
esac
