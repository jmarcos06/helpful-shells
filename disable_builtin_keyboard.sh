#!/bin/bash
# Date: 18/08/2022 dd-mm-yyyy
# Author: Joao Marcos
# my builtin MSI laptop keyboard stopped working for a while and now it inputs random keys
# this script find the internal keyboard ID and master ID and enable or disable it 

# find internal keyboard id using awk regex
keyboardID = $(xinput list | grep "Translated Set 2 keyboard" | awk '{ gsub (/[[:alpha:]]|[[:punct:]]/," ")}1' | awk '{print $3}')

# find internal keyboard master ID 
masterKeyboardID = $(xinput list | grep "Translated Set 2 keyboard" | awk '{ gsub (/[[:alpha]]|[[:punct:]]/," ")}1' | awk '{print $4}')

# Command to disable keyboard
xinput float $keyboardID

# Command to enable keyboard
# xinput reattach $keyboardID $masterKeyboardID
