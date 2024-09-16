#! /bin/bash

echo -e "This script is located in: $(dirname "$0")"
local_path=$(dirname $0)
cd $local_path
sleep 0.5

# Rename aaa0001_shell back to aaa0001
for shell in */aaa*_shell;
do
    mv $shell $pwd/${shell%_shell}
    echo "$shell renamed to ${shell%_shell}"
done