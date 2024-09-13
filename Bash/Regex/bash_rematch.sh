#!/usr/bin/env bash

str="Version 4.5.6"
if [[ $str =~ ([0-9]+)\.([0-9]+)\.([0-9]+) ]]; then
  # if chars before dot match any amount of 0-9's, then:
  echo "Major: ${BASH_REMATCH[1]}"  # print "Major: {first match}"
  echo "Minor: ${BASH_REMATCH[2]}"  # print "Minor: {second match}"
  echo "Patch: ${BASH_REMATCH[3]}"  # print "Patch: {third match}"
else
  echo "No version number found."
fi

