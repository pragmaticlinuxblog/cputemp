#!/bin/bash

#----------------------------------------------------------------------------------------
# Obtains the current value of the CPU temperature.
#----------------------------------------------------------------------------------------
function get_cpu_temp()
{
  # Initialize the result.
  local result=0.00
  # The first line in this file holds the CPU temperature as an integer times 1000.
  # Read the first line from the file.
  line=$(head -n 1 /sys/class/thermal/thermal_zone0/temp)
  # Test if the string is an integer as expected with a regular expression.
  if [[ $line =~ ^-?[0-9]+$ ]]
  then
    # Convert the CPU temperature to degrees Celsius and store as a string.
    result=$(awk "BEGIN {printf \"%.2f\n\", $line/1000}")
  fi
  # Give the result back to the caller.
  echo "$result"
}


#----------------------------------------------------------------------------------------
# Program to demonstrate how to obtain the current value of the CPU temperature.
#----------------------------------------------------------------------------------------
cputemp=$(get_cpu_temp)  
echo Current CPU temperature is $cputemp degrees Celsius.

