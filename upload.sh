#!/bin/sh
set -eu
cd "$(dirname "$0")"
rsync -crv www/ tuonela.scheme.org:/production/docs/www/surveys/
