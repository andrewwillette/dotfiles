#!/bin/sh
TASKS_DONE_DIR="$HOME/git/manual/employment/kunai/tasks_done"

for file in "$TASKS_DONE_DIR"/*; do
  filename=$(basename "$file")
  if [[ $filename =~ ([0-9]{1,2})_([0-9]{1,2})_([0-9]{2,4})_.*delivery.* ]]; then
    month=${BASH_REMATCH[1]}
    day=${BASH_REMATCH[2]}
    year=${BASH_REMATCH[3]}

    if [[ ${#year} -eq 2 ]]; then
      year="20$year"
    fi
    if [[ ${#day} -eq 1 ]]; then
      day="0$day"
    fi
    if [[ ${#month} -eq 1 ]]; then
      month="0$month"
    fi
    new_filename="kunai_delivery_$(printf $year)_$(printf $month)_$(printf $day).md"
    oldfile="$file"
    newfile="$TASKS_DONE_DIR/$new_filename"
    mv "$oldfile" "$newfile"
  fi
done
