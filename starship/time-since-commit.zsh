# Only proceed if there is actually a commit.
if [[ $(git log 2>&1 > /dev/null | grep -c "^fatal: bad default revision") == 0 ]]; then
  # Get the last commit.
  last_commit=`git log --pretty=format:'%at' -1 2> /dev/null`
  now=`date +%s`
  seconds_since_last_commit=$((now-last_commit))

  # Totals
  MINUTES=$((seconds_since_last_commit / 60))
  HOURS=$((seconds_since_last_commit/3600))

  # Sub-hours and sub-minutes
  DAYS=$((seconds_since_last_commit / 86400))
  SUB_HOURS=$((HOURS % 24))
  SUB_MINUTES=$((MINUTES % 60))

  if [ "$HOURS" -gt 24 ]; then
      echo "${DAYS}d"
  elif [ "$MINUTES" -gt 60 ]; then
      echo "${HOURS}h${SUB_MINUTES}m"
  else
      echo "${MINUTES}m"
  fi
fi
