#!/bin/bash
#This script will find out who is dealing at each game echo is requesting the game you're 
#searching for. cat is the name of the file you're searching for B(month/day) is for blackjack,
#R(month/day) is for Roulette, T(month/day) is for Texas Hold'em, grep $1 are official time 
#grep $2 searches AM/PM

echo $1
cat $2 | grep $3 | grep $4 
