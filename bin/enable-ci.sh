#!/bin/bash -e
cat config/.gitlab-ci.yml.txt > public/.gitlab-ci.yml
echo "gitlab-ci.yml has been added to your project."