#!/usr/bin/env bash

set -euo pipefail

cd ""/home/gigi/Sync/Kobo

if [[ -z "$(ls /home/gigi/Sync/Kobo)" ]]; then
    echo "~/Sync/Kobo directory empty, doing nothing and exiting."
    exit 0
fi

# Convert to .kepub for performance
kpubify -iu /home/gigi/Sync/Kobo/

# Clean up copied original epubs
rm "$(ls /home/gigi/Sync/Kobo | grep -v "kepub")"

# Copy to Dropbox
rclone copy /home/gigi/Sync/Kobo "Dropbox:Apps/Rakuten Kobo/rclone" --verbose >> /home/gigi/Sync/.rclone_logs/output.log
