#!/bin/sh
cd "$(dirname "$0")"
mkdir -p www
for md in $(cd surveys && ls *.md | sort -f); do
    base="${md%.*}"
    html="$base.html"
    pandoc --from=gfm "surveys/$md" -o "www/$html"
done
