#!/bin/bash
origin=$(git remote -v | awk '{if ($1=="origin"){print $2}}' | head -n 1)

grunt build
( cd dist
  git init
  git add .
  git commit -m "Deployed to Github Pages"
  git push --force --quiet "$origin" master
)
