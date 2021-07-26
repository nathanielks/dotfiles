#!/usr/bin/env bash
#
# Usage:
# bin/retrieve-cloudwatch-logs.sh foobar-prod-01/barbaz 2020-07-06T02:50:41.744-05:00 2020-07-06T02:52:25.644-05:00 --log-stream-names foobar-prod-01/foo/bf39bf5bd2824383af8110e24fabedc5 --region eu-central-1
#
# This script makes it easier to retrieve logs for a specified time period
# that's more easily copy/pastable to AWS support.
#
# This script takes 3 required parameters:
#   Log Group Name
#   Start timestamp with a timezone
#   End timestamp with a timezone
# Any additional parameters/flags will be passed directly to the `aws logs`
# script. By default it will search within a log group, but a filter pattern
# will need be passed as the script does not assume that.

LOG_GROUP="$1"
START="$(date '+%s%3N' -d "$2")"
END="$(date '+%s%3N' -d "$3")"

aws logs filter-log-events \
	--log-group-name "$LOG_GROUP" \
	--interleaved \
	--start-time "$START" \
	--end-time "$END"	\
	${@:4} \
	| jq -r '.events[] | "\( (.timestamp / 1000 ) |todateiso8601) \(.logStreamName) \(.message)"'
