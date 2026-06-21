#!/usr/bin/env sh
# Regenerate the design-system sync bundle's asset copies from the canonical
# source in ../assets. Those copies are git-ignored build outputs — assets/ is
# the single source of truth, so the bundle can never silently drift from it.
# Run this immediately before a /design-sync push.
set -e
here="$(cd "$(dirname "$0")" && pwd)"
cp "$here/../assets/gf-tokens.css" "$here/gf-tokens.css"
cp "$here/../assets/gf-nav.js"     "$here/gf-nav.js"
echo "design-system bundle refreshed from ../assets (gf-tokens.css, gf-nav.js)"
