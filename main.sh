#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Usage: ./main.sh <config source file> <csv file for definitions>"
	echo "<config source file> must be in the format:"
	echo "ACPI_AC"
	echo "ACPI_APEI_GHES"
	echo "ACPI_APEI_MEMORY_FAILURE"
	echo "etc..."
	echo "<csv file for definitions> should be an empty .csv file"
	exit 1
fi

export config_source=$1
export csv=$2

if [ ! -e $config_source ]
then
	echo "$config_source does not exist"
	exit 1
else if [ ! -e $csv ]
then
	echo "$csv does not exist"
	exit 1
fi

./find_config $config_source

./record_definitions $csv
