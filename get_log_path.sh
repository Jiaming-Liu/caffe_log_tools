#!/bin/bash
# get_log_path.sh pid
# get_log_path.sh pid YYYYMMDD
# get_log_path.sh pid YYYYMMDD-HHMMSS

# It echoes the path of the log file with specific pthread id

# the log file usually locate in this directory:
LOG_DIR="/tmp/"

# the log file is defaultly named in this format:
#    caffe.[SYS].[USER].log.INFO.[YYYYMMDD-HHMMSS].[PID]
LOG_FILE_NAME_REG_EXP="caffe\..*\..*\.log\.INFO\..*$2.*\.$1$"

LOG_NAME=$(ls $LOG_DIR -all |grep $LOG_FILE_NAME_REG_EXP -o)

if [ $? -ne 0 ]; then
	echo "---------------"
	echo "Error: Failed to find record! Please check the params."
	echo "---------------"
	exit 1
fi

if [ $(echo "$LOG_NAME"| wc -l) -gt 1 ]; then
	echo "$LOG_NAME"
	echo "---------------"
    echo "Error: Found multiple files! Please try to add the date params."
	echo "---------------"
	exit 1
fi

echo "$LOG_DIR$LOG_NAME"