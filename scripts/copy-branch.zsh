#!/bin/zsh

# A script for copying a branch name from git branch to the clipboard.

if [[ $# -ne 1 ]]; then
  echo "Missing correct number of arguments (1)."
  exit 1
elif [[ $1 =~ [^1-9]+$ ]]; then
  echo "Argument is not a integer between 1 and 9."
  exit 1
fi

gitBranch=$(echo $(git branch))
branches=(${(@s: :)gitBranch})

# Removes the * part before the main
for i in {1..$#branches}; do
  if [[ ${branches[$i]} == "*" ]]; then
    unset "branches[$i]"
    branches=(${branches[*]})
    break
  fi
done

if [[ $1 > $#branches ]]; then
  echo "Argument is greater than the number of branches listed in your repository."
  exit 1
fi

echo ${branches[$1]} | tr -d '\n' | pbcopy
echo "[${branches[$1]}] was copied to the clipboard!"