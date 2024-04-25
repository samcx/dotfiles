#!/bin/bash
set -euo pipefail

input="$1"
shift
files_dir="$HOME/.tarballs"
mkdir -p "$files_dir"

# Delete old files
rm -f "$files_dir"/*

# Copy in the source file
cp "$input" "$files_dir"

cd "$files_dir"

# Create the `vercel.json` file
jq -n --arg file "$input" '{ version: 2, rewrites: [ { "source": "/", "destination": @uri "/\($file)" } ], builds:
[ { src: "**/*", use: "@vercel/static" } ] }' > vercel.json

# Create deployment, copying the root `url` to clipboard instead of the aliased URL
url="$(vercel --prod --no-clipboard)"
printf "%s" "$url" | pbcopy
echo "Unique URL: $url"
