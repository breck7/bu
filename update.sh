#!/usr/bin/env bash
# Sync the shared template into each site as an independent local copy.
# Edit bu.scroll here, then run ./update.sh and rebuild the individual sites.
set -euo pipefail

bu_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

for destination in "$bu_dir"/*/bu.scroll; do
  [[ -f "$destination" ]] || continue
  cp -- "$bu_dir/bu.scroll" "$destination"
  printf 'Updated %s\n' "${destination#"$bu_dir/"}"
done
