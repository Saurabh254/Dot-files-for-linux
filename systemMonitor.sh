#!/bin/bash


#-------------------------------- Cpu Usage-----------------------------------

CPUUSAGE=$(cat <(grep 'cpu ' /proc/stat) <(sleep 1 && grep 'cpu ' /proc/stat) | awk -v RS="" '{printf("%02d", ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5))}')

# --------------------------------Memory Usage--------------------------------

MEMTOTAL=$(cat /proc/meminfo | grep MemTotal | awk '{printf ("%0.1f", $2/1024000)}')

MEMAVA=$(cat /proc/meminfo | grep MemAvailable | awk '{printf ("%0.1f", $2/1024000)}')

# -------------------------------- SSD Usage----------------------------------

SSDSIZE=$(df -hl /dev/nvme0n1p2| grep nvme0n1p2 | awk '{print $2}' | sed -e 's/G//')

SSDUSED=$(df -hl /dev/nvme0n1p2 | grep nvme0n1p2| awk '{print $3}' | sed -e 's/G//')

# ------------------------------CPU TEMPERATURE-------------------------------
CPUTEMP=$(acpi -t)


# ===============================================================================

# ------------------------------  Notification Display  -------------------------

# ===============================================================================


echo "RAM: $MEMAVA"GB"/$MEMTOTAL"GB" | ROM: $SSDUSED"GB"/$SSDSIZE"GB" | CPU TEMPERATURE: $CPUTEMP | CPU USAGE: $CPUUSAGE"%""



