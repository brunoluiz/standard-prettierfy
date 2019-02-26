# standardjs-prettierfy

This script makes the task of adding [`standard`](https://standardjs.com/) and [`prettier`](https://prettier.io/) easier. A simple `./prettify.sh $APP_PATH $APP_BRANCH` will do the job.

## Executed tasks

- Adds required dependencies
- Adds required configs
- Edit `package.json` with the required configs
- Fix formatting using prettier
- Push branch to remote

## Parameters

- `APP_PATH (required)`: target folder
- `APP_BRANCH (default=`master`|optional)`: branch from where it should checkout the `chore/prettier-standard` branch

## Dependencies

- [`jq`](https://stedolan.github.io/jq/): used to manipulate `package.json`
