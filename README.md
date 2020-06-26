# CpuTemp
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
Source code snippets in several programming languages for reading the CPU temperature in Linux. Tested on Debian and Raspbian.

## Terminal

One liner:

`head -n 1 /sys/class/thermal/thermal_zone0/temp | xargs -I{} awk "BEGIN {printf \"%.2f\n\", {}/1000}"`

The first line in file `/sys/class/thermal/thermal_zone0/temp` is read and then piped to `awk` with the help of `xargs`. `awk` converts the CPU temperature to a floating point value in degrees Celsius.

## Python

Make sure the script is executable and then you can run it directly:

`cd source\python`

`chmod +x cputemp.py`

`.\cputemp.py`

The Python script contains a reusable function `get_cpu_temp()` that you can copy to your own Python program. Additionally, it contains a  test program implemented in function `main()` to demonstrate how to use the `get_cpu_temp()` function.

## Shell

Make sure the script is executable and then you can run it directly:

`cd source\shell`

`chmod +x cputemp.sh`

`.\cputemp.sh`

The shell script contains a reusable function `get_cpu_temp()` that you can copy to your own shell script. Additionally, it contains a  test program to demonstrate how to use the `get_cpu_temp()` function.

## C

Compile the source-file and link it to an executable. Afterwards you can run it directly:

`cd source\c`

`gcc cputemp.c -o cputemp`

`.\cputemp`

The C program contains a reusable function `get_cpu_temp()` that you can copy to your own C program. Additionally, it contains a  test program implemented in function `main()` to demonstrate how to use the `get_cpu_temp()` function.

## Pascal

Compile the source-file and link it to an executable. Afterwards you can run it directly:

`cd source\pascal`

`fpc cputemp.pas -ocputemp`

`.\cputemp`

The Pascal program contains a reusable function `get_cpu_temp()` that you can copy to your own Pascal program. Additionally, it contains a  test program to demonstrate how to use the `get_cpu_temp()` function.

