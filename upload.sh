#!/bin/sh
set -eu
cd "$(dirname "$0")"
rsync -vr www/ alpha.servers.scheme.org:/production/doc/www/surveys/
