#!/bin/sh
cd "$(dirname "$0")"
mkdir -p www
pandoc --from=gfm "surveys/index.md" -o "www/index.html"
for md in $(cd surveys && ls *.md | sort -f | grep -v index.md); do
    base="${md%.*}"
    mkdir -p "www/$base"
    pandoc --from=gfm "surveys/$md" -o "www/$base/index.html"
done
