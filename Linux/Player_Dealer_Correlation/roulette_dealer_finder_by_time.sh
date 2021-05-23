#!/bin/bash
#grep -i 00 0310_Dealer_schedule 0312_Dealer_schedule 0315_Dealer_schedule |grep -i $1| grep -i $2 | grep -i " $3 " | awk '{print $5,$6}'
grep -i 00 0310_Dealer_schedule 0312_Dealer_schedule 0315_Dealer_schedule | grep -i $1 | grep -i $2 | grep $3 | awk '{print $5,$6}'

