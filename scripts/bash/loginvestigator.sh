#!/usr/bin/env bash
# Counts lines containing "Error"

count=$(grep -c "Error" server.log)
echo "Lines containing 'Error': $count"
