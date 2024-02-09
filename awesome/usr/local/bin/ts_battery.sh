#!/bin/bash 
acpi > bat1
cut -c12-14 bat1 > batchar
cut -c25-26 bat1 > bat2
# if load percentage < 10, 26 is "%"
tr -d '%' < bat2 > batpc
