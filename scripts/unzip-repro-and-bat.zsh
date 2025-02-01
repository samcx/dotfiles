#!/bin/zsh

# A script for either cloning a GitHub repro then executing `bat --paging=never package.json` or unzipping a zip repro to a $NAME directory, moving that directory to the Vercel\ Next.js directory, then executing `bat --paging=never package.json`.

if [[ $# != 1 ]]; then
  echo "Error: This script requires exactly one argument."
  exit 1
fi

read "NAME?What do you want to name the repro directory? "
read "AREA?Which area of Next.js? "

if [[ $1 == *github* ]]; then
  pattern="https://github.com/"
  result=${1#$pattern}
  cd ~/Documents/Vercel\ Next.js/$AREA && gh repo clone $result $NAME && cd $NAME && rm -rf package-lock.json yarn.lock && bat --paging=never package.json
else
  cd ~/Downloads && unzip -q -d $NAME $1 && mv $NAME ~/Documents/Vercel\ Next.js/$AREA && cd ~/Documents/Vercel\ Next.js/$AREA/$NAME && rm -rf package-lock.json yarn.lock && bat --paging=never package.json
  echo "Successfully unzipped $1 to $NAME!"
fi
