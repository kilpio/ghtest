#!/usr/bin/env bash


snapshot='snapshot-1.'${1}

git checkout master
git pull
git checkout -B ${snapshot}
echo $(date) >> noff
git stage noff
git commit -m "Snapshot master as ${snapshot}"
git push

git checkout stable
git pull
git checkout master -- .
echo $(date) >> noff
git stage noff
git commit -m "Fix stable as it is in ${snapshot}"
git push


