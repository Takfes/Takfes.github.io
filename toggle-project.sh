#!/bin/bash

echo "* Select project to use."
echo "* Any remaining projects will be archived"
echo "1 - custom"
echo "2 - jekyll"
read input

mkdir -p archive
mkdir -p archive/jekyll_archive
mkdir -p archive/custom_archive

project_jekyll=(_posts _site .devcontainer .sass-cache _config.yml 404.html about.md dockerfile Gemfile Gemfile.lock index.md)
project_custom=(home.html index.html css)

case $input in
    1)
        # user info
        echo "project custom to be activated"
        # archive jekyll files
        for x in $project_jekyll
        do
            mv ./$x archive/jekyll_archive/$x > /dev/null 2>&1
        done
        # unarchive archived contents
        mv archive/custom_archive/* . > /dev/null 2>&1
        ;;
    2)
        # user info
        echo "project jekyll to be activated"
        # archive custom files
        for x in $project_custom
        do
            mv ./$x archive/custom_archive/$x > /dev/null 2>&1
        done
        # unarchive archived contents
        mv archive/jekyll_archive/* . > /dev/null 2>&1
        ;;
    *)
        echo "Wrong input terminates w/o taking any actions"
        ;;
esac