#!/bin/bash
# Usage:
#     save_logfile.sh prefix pid
#     save_logfile.sh prefix pid YYYYMMDD
#     save_logfile.sh prefix pid YYYYMMDD-HHMMSS

foo=$(sh get_log_path.sh $2 $3)

if [ "$?" -ne 0 ]; then
echo "$foo"
exit 1
fi

# Expression ${foo##*/} gets the text after the last "/", i.e. the filename
cp "$foo" "$1${foo##*/}"

echo "Saved as: $1${foo##*/}"