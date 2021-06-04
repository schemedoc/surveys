#!/bin/sh
cd "$(dirname "$0")"
mkdir -p www
for md in $(cd surveys && ls *.md | sort -f); do
    base="${md%.*}"
    html="$base.html"
    markdown <"surveys/$md" >"www/$html"
done
