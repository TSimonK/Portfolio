#!/bin/bash
# This script filters out all dealers into their respective games by the dates 0310 0312 0315

echo 'Dealer Schedule for 0310' > R0310
echo >> R0310
awk -F" " '{print $1, $2, $5, $6}' 0310_Dealer_schedule >> R0310
echo >> R0312
echo 'Dealer Schedule for 0312' >> R0312
echo >> R0312
awk -F" " '{print $1, $2, $5, $6}' 0312_Dealer_schedule >> R0312
echo >> R0315
echo 'Dealer Schedule for 0315' >> R0315
echo >> R0315
awk -F" " '{print $1, $2, $5, $6}' 0315_Dealer_schedule >> R0315

echo 'Dealer Schedule for 0310' > B0310
echo >> B0310
awk -F" " '{print $1, $2, $3, $4}' 0310_Dealer_schedule >> B0310
echo >> B0312
echo 'Dealer Schedule for 0312' >> B0312
echo >> B0312
awk -F" " '{print $1, $2, $3, $4}' 0312_Dealer_schedule >> B0312
echo >> B0315
echo 'Dealer Schedule for 0315' >> B0315
echo >> B0315
awk -F" " '{print $1, $2, $3, $4}' 0315_Dealer_schedule >> B0315

echo 'Dealer Schedule for 0310' > T0310
echo >> T0310
awk -F" " '{print $1, $2, $7, $8}' 0310_Dealer_schedule >> T0310
echo >> T0312
echo 'Dealer Schedule for 0312' >> T0312
echo >> T0312
awk -F" " '{print $1, $2, $7, $8}' 0312_Dealer_schedule >> T0312
echo >> T0315
echo 'Dealer Schedule for 0315' >> T0315
echo >> T0315
awk -F" " '{print $1, $2, $7, $8}' 0315_Dealer_schedule >> T0315
