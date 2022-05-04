#!/bin/bash
#This script helps finds the person who was at the losing games and appends it to the notes file
#Please Note you must view Roulette_Losses to determine who to search for. It may take several 
#searches to find the person so I designed it to remake the file each name you search for.

cat Roulette_Losses | awk -F" " '{print $1, $2}' > Notes_Player_Analysis
echo >> Notes_Player_Analysis
cat Roulette_Losses | grep -i $1 | grep -i $2 | wc -l >> Notes_Player_Analysis
echo $1 $2 >> Notes_Player_Analysis



