#!/bin/zsh

# A script for cd'ing into a commonly-used directories.

if [[ $# != 1 ]]; then
  echo "Missing correct number of arguments (1)."
  return 1
fi

if [[ $1 = "front" ]]; then
  cd ~/Documents/Vercel/front
elif [[ $1 = "next" ]]; then
  cd ~/Documents/Vercel/next.js
elif [[ $1 = "samcx" ]]; then
  cd ~/Documents/Igloo/samcx
elif [[ $1 = "vercel-nextjs" ]]; then
  cd ~/Documents/Vercel/vercel-nextjs
elif [[ $1 = "v0" ]]; then
  cd ~/Documents/Vercel/v0
else
  echo "Directory not listed in script!"
fi

return 0
