#!/bin/bash
BRANCH_REGEX="2.2[0-9]|master"

set -e # exit with nonzero exit code if anything fails

if [ "$TRAVIS_REPO_SLUG" == "dhis2/dhis2-docs" ]  && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  if [[ "$TRAVIS_BRANCH" =~ $BRANCH_REGEX ]]; then
    mvn -Ddocbkx.fopLogLevel=ERROR -Denforcer.fail=false -q package
  else
    mvn -f pom-short.xml -Ddocbkx.fopLogLevel=ERROR -Denforcer.fail=false  package
  fi
fi 

exit $?
