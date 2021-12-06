#! /bin/bash -e
# use btrfs commands to create daily snapshots, with weekly rollover

suffix=$(date +%a | tr 'A-Z' 'a-z')  # mon, tue, ...

for vol in "$@"; do
  [[ -d "$vol" ]] || ( echo "$vol not found"; exit 1 )
  touch $vol
  btrfs subvolume delete $vol-$suffix 2>/dev/null || true
  btrfs subvolume snapshot -r $vol $vol-$suffix # prints a "Create snapshot ..." message
done
