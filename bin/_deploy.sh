#!/bin/bash

set -ev

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "${GIT_AUTHOR_EMAIL}"
git config --global user.name "${GIT_AUTHOR_NAME}"

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git gh-pages

cd gh-pages
cp -r ../_site/* ./

# optional directories
[ -d ./data ] && cp -r ../data ./
[ -d ./collections ] && cp -r ../collections ./

git add --all *
git commit -m"Update the site" || true
git push origin gh-pages
