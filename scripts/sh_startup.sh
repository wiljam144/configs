#!/bin/bash

messages=(
	"Hello"
	"World"
)

echo ${messages[@]}

current_date=$(date "+%d-%m-%Y")

hash=$(echo -n $current_date | md5sum)

echo ${hash% *}
