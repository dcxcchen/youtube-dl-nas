#!/bin/bash

subber /usr/src/app/Auth.json

sudo ss-local -c /ssconfig/config.json &

python3 -u /usr/src/app/upd_schedule.py &
python3 -u /usr/src/app/youtube-dl-server.py 
