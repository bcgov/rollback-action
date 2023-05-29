#!/bin/bash

# Fetch the latest tag
git fetch --tags

# Get the latest tag name
latest_tag=$(git describe --tags $(git rev-list --tags --max-count=1))

# Checkout the latest tag
git checkout "$latest_tag"

# Merge the latest tag into the master branch
git checkout master
git merge --no-ff "$latest_tag" -m "Rollback to $latest_tag"