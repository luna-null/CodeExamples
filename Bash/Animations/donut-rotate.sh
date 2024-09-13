#!/usr/bin/env bash

# Characters for donut simulation
frames=(
    '   ,---.   '
    '  (     )  '
    '   `-O-\'   '
    '  (     )  '
)

# Infinite loop to rotate the donut
while true; do
    for frame in "${frames[@]}"; do
        printf "\r%s" "$frame"   # Print each frame in place (using \r to return to the start of the line)
        sleep 0.1                # Adjust the sleep time to control the speed of rotation
    done
done
