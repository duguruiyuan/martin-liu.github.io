#!/bin/bash
grunt build
( cd dist
  git init
  git add .
  git commit -m "Deployed to Github Pages"
  git push --force --quiet "git@github.com:martin-liu/martin-liu.github.io.git" master
)
