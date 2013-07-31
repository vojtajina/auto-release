#!/bin/bash


BASE="/usr/local/google/home/vojta/auto-release"

function title {
  echo "#########################################################################"
  echo $1
  echo "#########################################################################"
}

function release {
  title "$2"
  cd $BASE/$1
  grunt auto-release
}

# Karma and plugins
release "karma" "Karma CANARY"
# title "Karma STABLE"
# grunt auto-release --auto-release-branch=stable
release "karma-jasmine" "Karma JASMINE plugin"
release "karma-mocha" "Karma MOCHA plugin"
release "karma-qunit" "Karma QUNIT plugin"
release "karma-coverage" "Karma COVERAGE plugin"
release "karma-closure" "Karma CLOSURE plugin"
release "karma-requirejs" "Karma REQUIREJS plugin"
release "karma-ng-scenario" "Karma NG-SCENARIO plugin"
release "karma-chrome-launcher" "Karma CHROME-LAUNCHER plugin"
release "karma-firefox-launcher" "Karma FIREFOX-LAUNCHER plugin"
release "karma-phantomjs-launcher" "Karma PHANTOMJS-LAUNCHER plugin"
release "karma-ie-launcher" "Karma IE-LAUNCHER plugin"
release "karma-safari-launcher" "Karma SAFARI-LAUNCHER plugin"
release "karma-script-launcher" "Karma SCRIPT-LAUNCHER plugin"
release "karma-sauce-launcher" "Karma SAUCE-LAUNCHER plugin"
release "karma-opera-launcher" "Karma OPERA-LAUNCHER plugin"
release "karma-growl-reporter" "Karma GROWL-REPORTER plugin"
release "karma-junit-reporter" "Karma JUNIT-REPORTER plugin"
release "karma-coffee-preprocessor" "Karma COFFEE-PREPROCESSOR plugin"
release "karma-ng-html2js-preprocessor" "Karma NG-HTML-PREPROCESSOR plugin"
release "karma-html2js-preprocessor" "Karma HTML-PREPROCESSOR plugin"


# Grunt plugins
release "grunt-auto-release" "Grunt AUTO-RELEASE plugin"
release "grunt-bump" "Grunt BUMP plugin"
