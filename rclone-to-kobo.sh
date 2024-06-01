#!/usr/bin/env bash
#Convert to .kepub for performance
kpubify -iu /home/gigi/Sync/Kobo/

# Clean up copied original epubs
ls /home/gigi/Sync/Kobo | grep -v "kepub" | xargs rm

# Copy to Dropbox
rclone copy /home/gigi/Sync/Kobo "Dropbox:Apps/Rakuten Kobo/rclone" --verbose >> /home/gigi/Sync/.rclone_logs/output.log
