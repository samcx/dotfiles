#!/bin/bash

# A script for creating a Next.js tarball and then hosting it on Vercel.

set -euo pipefail

pack_output="$(pnpm pack)"
echo "$pack_output successfully created!"

files_dir="$HOME/.tarballs"
mkdir -p "$files_dir"

# Delete old files
rm -f "$files_dir"/*

# Copy in the source file
cp "$pack_output" "$files_dir"

cd "$files_dir"

# Create the `vercel.json` file
jq -n --arg file "$pack_output" '{ rewrites: [ { "source": "/", "destination": @uri "/\($file)" } ] }' > vercel.json

# Create deployment, copying the root `url` to clipboard instead of the aliased URL
url="$(vercel --prod --yes)"
printf "%s" "$url" | pbcopy
echo "Unique URL: $url"

cd ~/Documents/Vercel/next.js/packages/next
rm -f "$pack_output"
