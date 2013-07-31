#!/bin/bash

source ~/.bashrc

STDOUT=/var/tmp/vojta.auto-release.stdout
STDERR=/var/tmp/vojta.auto-release.stderr
MAIL=/var/tmp/vojta.auto-release.mail
EMAIL=vojta.jina@gmail.com

echo "Running at $(date)"

BASE_DIR="$(dirname $0)"
RELEASE_ALL_SCRIPT="$BASE_DIR/release-all.sh"
FORMAT_ANSI_SCRIPT="$BASE_DIR/format-ansi.js"

# run the release script
$RELEASE_ALL_SCRIPT 1> $STDOUT 2> $STDERR

# construct the email
echo "To: $EMAIL
Subject: $(date '+%Y-%m-%d') AUTO RELEASE
MIME-Version: 1.0
Content-Type: text/html
Content-Disposition: inline
" > $MAIL

echo "Today is $(date)<br>" >> $MAIL
echo "" >> $MAIL
$FORMAT_ANSI_SCRIPT $STDOUT >> $MAIL
echo "" >> $MAIL

if [ ! -s $STDERR ]; then
  echo "The error output was empty." >> $MAIL
else
  echo "ERROR OUTPUT:" >> $MAIL
  $FORMAT_ANSI_SCRIPT $STDERR >> $MAIL
fi

# send the report
cat $MAIL | /usr/sbin/sendmail -i -t
