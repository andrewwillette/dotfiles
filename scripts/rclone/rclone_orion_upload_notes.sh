#!/bin/sh

# uploads files to drive
# https://drive.google.com/drive/u/1/folders/1_Lpq_a2QenVZGJVy_Yrn9iHQRMSEezJl

# function to upload files to google drive
CloneMaterialsFile() {
	if [ -z "$1" ]; then
		echo "No file specified"
		return
	fi
	if [ ! -f $1 ]; then
		echo "$1 does not exist"
		return
	fi
	rclone copy $1 "$2"
}

CloneMaterialsDirectory() {
	if [ -z "$1" ]; then
		echo "No directory specified"
		return
	fi
	if [ ! -d $1 ]; then
		echo "$1 does not exist"
		return
	fi
	rclone copy $1 "$2"
}

# CloneMaterialsFile ~/git/manual/employment/kunai/tasks_todo/orion_notes.md "kunaicaponedrive:/ITE/Tech Director Materials"
# CloneMaterialsFile ~/git/manual/employment/kunai/tasks_todo/orion_onboarding.md "kunaicaponedrive:/ITE/Tech Director Materials"
CloneMaterialsDirectory ~/git/manual/employment/kunai/dailynotesmexico "kunaicaponedrive:/ITE/Tech Director Materials/dailynotes"
