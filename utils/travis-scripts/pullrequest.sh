#!/bin/bash

#The -e flag causes the script to exit as soon as one command returns a non-zero exit code.
#The -v flag makes the shell print all lines in the script before executing them
set -ev

if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
	cd public 
  ls
  npm run lint
fi

if [ "${TRAVIS_PULL_REQUEST}" != "false" ]; then
	echo rafael
fi
