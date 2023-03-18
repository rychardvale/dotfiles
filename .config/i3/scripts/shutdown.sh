#!/bin/bash

echo

read -r -p "Are you sure you want to poweroff? (y/n)" a;
if [ "$a" == "y" ]; then
	shutdown -P now
fi
