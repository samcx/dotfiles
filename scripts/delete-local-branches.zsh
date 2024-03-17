#!/bin/zsh

# A script for deleting local git branches.
# Assumes that the default branch is main.
#
# gbdel <command> [-D]
#
# command:
# -all  Delete all local git branches besides main.
# 1-∞   Integer to grab specific line→branch from the output of the command `git branch`.
#
# -D (optional):
# Force delete branch.
#
# Example 1:
# ▲ samcx [main] gbdel -all
# Deleted branch test1 (was 4447d698f7).
# Deleted branch test2 (was 4447d698f7).
# Deleted branch test3 (was 4447d698f7).
#
# Example 2:
# ▲ samcx [main] gbdel 2
# Deleted branch test (was 4447d698f7).
#
# Example 3:
# ▲ samcx [main] gbdel 2
# error: The branch 'test' is not fully merged.
# If you are sure you want to delete it, run 'gb del -D'.
# ▲ samcx [main] gbdel 2 -D
# Deleted branch test (was d8be94e).

# [WIP] Not handling all the edge cases.

if [[ $# -eq 0 ]]; then
  echo "Missing required arguments."
  exit 1
fi

if [[ $1 == "-all" ]]; then
  git branch | grep -v "main" | xargs git branch -D
  exit 0
fi

if [[ $1 =~ ^[1-9]+$ ]]; then
  grab_line() {
    git branch | sed -n "${1}p"
  }

  line=$(grab_line $1)
  branch=${line:2}

  if [[ ${#branch} -eq 0 ]]; then
    echo "Branch doesn't exist!"
    exit 1
  elif [[ $branch == "main" ]]; then
    echo "Can't delete default branch ${branch}!"
    exit 1
  elif [[ $2 && $2 == "-D" ]]; then
    git branch -D $branch
  else
    git branch -d $branch
  fi
else
  echo "First argument is not a integer greater than 0."
  exit 1
fi
