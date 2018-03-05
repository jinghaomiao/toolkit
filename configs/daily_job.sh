#!/usr/bin/env bash

# Add this into crontab:
# * 3 * * * /home/username/bin/rebuild-dns-zones

echo "Add this to 'crontab -e':"
#     m h
echo "* 3 * * * $(realpath $0)"


# Add your jobs here.
