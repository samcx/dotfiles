#!/bin/zsh

# A script for outputting a specific line.
# Can also copy the line to the clipboard.
#
# line <line number> <file> [-C]
#
# line number:
# An integer to grab a specific line.
#
# file:
# The input file.
#
# -C (optional):
# Copies line to clipboard.
#
# Example 1:
# ▲ samcx [main] line 7 package.json
#   "packageManager": "pnpm@7.20.0",
#
# Example 2:
# ▲ samcx [main] line 7 package.json -C
#   Line 7 was copied to the clipboard!

# [WIP] Not handling all the edge cases.

if [[ $# -le 1 ]]; then
  echo "Missing required arguments."
  exit 1
fi

function grab_line() {
  local line=$(head -n $1 $2 | tail -n 1)

  if [[ $3 && $3 == "-C" ]]; then
    echo $line | pbcopy
    echo "Line $1 was copied to the clipboard!"
  else
    echo $line
  fi
}

(grab_line $1 $2 $3)
