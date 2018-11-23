#!/bin/bash

# When creating this script, the following articles were referred.
# reference articles:
#  https://ponzmild.hatenablog.com/entry/2018/01/06/191225
#  https://dev.classmethod.jp/devenv/api-blueprint-github-travisci-s3-preview/

# Move to current dire
cd "$(dirname "$0")"

# get the remote status
git remote update

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    echo "Up-to-date"
elif [ $LOCAL = $BASE ]; then
    echo "Need to pull"
    git pull

    ./create_api_blueprint.sh
elif [ $REMOTE = $BASE ]; then
    echo "Need to push"
else
    echo "Diverged"
fi
