#!/usr/bin/env bash
# Lists top 5 processes by memory usage (%MEM)
# Output: Process Name, PID, Memory Usage

ps -eo comm,pid,%mem --sort=-%mem | head -n 6
