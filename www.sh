#!/bin/sh
cd "$(dirname "$0")"
mkdir -p www
for md in $(cd surveys && ls *.md | sort -f); do
    base="${md%.*}"
    mkdir -p "www/$base"
    pandoc --from=gfm "surveys/$md" -o "www/$base/index.html"
done
