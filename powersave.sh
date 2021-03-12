#!/bin/bash

# powersave.sh
# A simple little helper script to set the CPUs to a given governor.
# Useful for powersaving on laptops or making a home server quiet.
# Author: stefan.huber@stusta.de
# License: None. Free as in Free Beer.

GOVERNOR=$1
USAGE="$0 [governor]\n
Sets all cpus to the given governor.
If no governor was given, setting to 'powersave'.
 '$0 schedutil' to set CPU behavior back to ubuntu defaults."

if [ "x$GOVERNOR" = "x-h" ]; then
	echo "$USAGE"
	exit
fi

if [ "x$GOVERNOR" = "xhelp" ]; then
	echo "$USAGE"
	exit
fi

# if no governor argument was given, set to powersave.
[ "x$GOVERNOR" = "x" ] && GOVERNOR=powersave

echo "Setting all CPUs to $GOVERNOR".
for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
	echo $GOVERNOR | sudo tee "$cpu" > /dev/null
done
