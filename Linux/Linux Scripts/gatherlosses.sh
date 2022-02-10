#!/bin/bash
#This gathers and Collates all losses by date and time.

echo 0310 >> Roulette_Losses
echo >> Roulette_Losses
cat *0310* | grep - >> Roulette_Losses
echo >> Roulette_Losses
echo 0312 >> Roulette_Losses
echo >> Roulette_Losses
cat *0312* | grep - >> Roulette_Losses
echo >> Roulette_Losses
echo 0315 >> Roulette_Losses
echo >> Roulette_Losses
cat *0315* | grep - >> Roulette_Losses
