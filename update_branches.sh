#!/bin/bash

# List of branches to update
branches=("main" "master" "develop") # Replace with your branch names

# File to add or modify
file="/home/nilesh/myproject/*" # Replace with your file path
commit_message="Add or modify files"

# Loop through branches
for branch in "${branches[@]}"; do
    echo "Switching to branch $branch"
    git checkout $branch

    # Check if the file exists in the branch; if not, create or modify it
    if [ -f $file ]; then
        echo "Adding $file to branch $branch"
        git add $file
        git commit -m "$commit_message"
        git push origin $branch
    else
        echo "$file does not exist in branch $branch"
    fi
done

# Switch back to the master branch (or another default branch)
git checkout master
