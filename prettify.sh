#!/bin/sh

APP_PATH=$1
PRETTIER_CONF=$PWD/.prettierrc.json
EDITOR_CONF=$PWD/.editorconfig

[ -z "$APP_PATH" ] && echo 'No project informed!' && exit
cd $APP_PATH

# update repo
git checkout dev
git pull

# create prettier branch
git branch -D chore/prettier-standard
git checkout -b chore/prettier-standard

# set-up prettier and standard
cp $EDITOR_CONF .
cp $PRETTIER_CONF .
npm install husky lint-staged prettier standard

jq '. + { scripts: { "lint": "standard" } }' package.json > package.json.tmp && mv -f package.json.tmp package.json
jq '. + { husky: { "hooks": { "pre-commit": "lint-staged" } } }'  package.json > package.json.tmp && mv -f package.json.tmp package.json
jq '. + { "lint-staged": { "*.{js,json,md}": [ "prettier --write", "git add" ] } }'  package.json > package.json.tmp && mv -f package.json.tmp package.json

git add --all
git commit -m 'chore: Salut prettier and standard 🙌'

# prettify code
./node_modules/.bin/prettier --write "**/*.js"
git add --all
git commit -m 'fix: Prettify 🔥'

# push changes (open PR manually)
git push -u origin chore/prettier-standard

