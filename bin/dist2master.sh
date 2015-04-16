#!/bin/bash
grunt build
( cd dist
  git init
  git add .
  git commit -m "Deployed to Github Pages"
  git push --force --quiet "https://github.com/martin-liu/martin-liu.github.io.git" master
)
