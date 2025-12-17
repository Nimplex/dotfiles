#!/bin/bash

choices=("cancel" "exit")

res=$(printf '%s\n' "${choices[@]}" | tofi)

if [ "$res" = "exit" ]; then
  hyprctl dispatch exit
fi
