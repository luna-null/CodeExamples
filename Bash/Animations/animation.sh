#!/usr/bin/env bash

ind=$(read -n 1 ind &)
load() 
{
	while :; 
	do
		printf '\r[      ]'
		sleep 0.05
		printf '\r[#     ]'
		sleep 0.05
		printf '\r[##    ]'
		sleep 0.05
		printf '\r[###   ]'
		sleep 0.05
		printf '\r[####  ]'
		sleep 0.05
		printf '\r[##### ]'
		sleep 0.05
		printf '\r[######]'
		sleep 0.05
	done
}

load & 
load_pid=$!

read -n 1 -s

kill $load_pid
wait $load_pid 2>/dev/null
echo ""
