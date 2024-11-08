#!/bin/zsh

# A script for moving a Next.js reproduction repository to the ../next.js/__repro__ directory.

current_dir=$(pwd)

echo "Removing .next, node_modules, and package.json..."

rm -rf .next node_modules package.json

echo "Done removing files!"
echo "Copying files to ../next.js/__repro__..."

cp -r $current_dir $HOME/Documents/Vercel/next.js/__repro__/

echo "✓ Successfully moved reproduction!"
