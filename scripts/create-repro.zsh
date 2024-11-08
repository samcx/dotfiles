#!/bin/zsh

# A script to create a Next.js reproduction repository

read "NAME?What do you want to name the repro directory? "

pnpm create next-app@canary $NAME --app --empty --eslint --import-alias='@/*' --no-tailwind --no-src-dir --ts --turbopack --use-pnpm && cd $NAME && open . -a "Cursor"
