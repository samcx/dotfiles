#!/bin/zsh

# A script to create a Next.js reproduction repository

read "NAME?What do you want to name the repro directory? "

pnpm create next-app@latest $NAME --ts --eslint --no-tailwind --no-src-dir --use-pnpm -e reproduction-template && cd $NAME && open . -a "Zed"
