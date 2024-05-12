#!/bin/bash

# Read the file with the repository URLs
while IFS= read -r repo
do
  # Clone each repository
  git clone --depth 1 "$repo"
done < repo_links.txt
