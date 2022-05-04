#!/bin/bash
#This script collates and dumps data from each game file into a file called Dealers_working_during_losses
#The naming structure for the games are R(month/day) for Roulette, B(month/day)for Blackjack,
#T(month/day) for Texas Hole EM.

#Input the Day and Month so it will be printed into Dealer_working_during_losses 
echo $1 >> Dealers_working_during_losses
#cat $2 is the file you want searched, $3 searches for the time and $4 searches for AM/PM
#then dumps it into Dealers_working_during_losses
cat $2 | grep -i $3 | grep -i $4 >> Dealers_working_during_losses

