#!/usr/bin/env bash


snapshot='snapshot-1.'${1}

git checkout master
git pull
echo $(date) >> noff
git stage noff
git commit -m "update noff"
git push


git checkout master
git pull
git checkout -B ${snapshot}
echo $(date) >> noff
git stage noff
git commit -m "Snapshot master as ${snapshot}"
git push

git checkout master
git pull
#git checkout master -- .
git merge -s ours --no-commit stable
echo $(date) >> noff
git stage noff
git commit -m "Fix stable as it is in ${snapshot}"
git checkout stable
git merge master
git push
git checkout master


