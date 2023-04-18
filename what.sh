#!/bin/bash
echo "<img>/usr/share/icons/Bluecurve/16x16/apps/gnome-monitor.png</img>"
declare -i cpuFreq
cpuFreq=$(cat /proc/cpuinfo | grep "cpu MHz" | sed 's/\ \ */ /g' | cut -f3 -d" " | cut -f1 -d".")
if [ $cpuFreq -ge 1000 ]
then
  cpu=$(echo $cpuFreq | cut -c1).$(echo $cpuFreq | cut -c2)GHz
else
  cpu=${cpuFreq}MHz
fi
echo "<txt>"$(cat /proc/acpi/thermal_zone/THM/temperature | sed 's/\ \ */ /g' | cut -f2 -d" ")" C</txt>"
echo "<tool>Freq: "$cpu"</tool>"