### Explanation

This repo contains:
- systemd service setup files, set to trigger on changes to a particular directory
- a shell script that the systemd service runs

The purpose is just to enable a really simple workflow for transferring files to my Kobo e-reader. All I have to do is copy/drop files into a particular folder and the script...
- converts regular .epubs to the .kepub format
- cleans up the original .epubs
- sends the files to Dropbox

And on my Kobo, I just open Dropbox and pull down whatever files I want.

### Why?

I preferred this way to running Dropbox's daemon(dropboxd) on my laptop. And to get automatic conversion and cleanup, I would have had to set up a service and script anyway.

### Setup Notes

I put my systemd service files in ~/.config/systemd/user and enabled it as a user service. When I tried to enable the service from a different directory in my home folder, the SELinux context prevented me from adding the service straightway.

#### Dependencies

- kpubify: converter tool
- rclone: cloud file transfer/sync tool
