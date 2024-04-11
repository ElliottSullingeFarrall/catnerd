#!/usr/bin/env bash

# Lock flake inputs
nix flake lock --option warn-dirty false

# Commit all changes
git commit -aq --allow-empty

# If commit fails, exit
if [ $? -ne 0 ]; then
    exit 1
fi

# Run checks
nix flake check

# If checks fails, undo the commit and exit
if [ $? -ne 0 ]; then
    git reset -q HEAD~
    exit 1
fi

# Push changes
git push -q
exit 0