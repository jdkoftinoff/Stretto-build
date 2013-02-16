#! /bin/bash -e

git submodule foreach --recursive git submodule init
git submodule foreach --recursive git submodule update
git submodule foreach --recursive git pull

( 
    while read submodule branch; do
        echo updating $submodule to branch $branch
        ( cd "$submodule" && git checkout "$branch" && git fetch origin && git merge "origin/$branch" )
        echo done
    done 
) <.submodule-branches

