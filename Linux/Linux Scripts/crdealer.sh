#!/bin/bash
#This Script will count the dealer found in Dealers_working_during_losses and dump that data into
#Notes_Dealer_Analysis but you must view the file with human eyes to grep the different dealers

cat Dealers_working_during_losses | grep -i $1 | grep -i $2 | wc -l >> Notes_Dealer_Analysis
echo $1 $2 >> Notes_Dealer_Analysis

