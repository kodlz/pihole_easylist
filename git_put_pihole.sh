#!/bin/bash
#start manual-easylist.sh
cd /root/git/pihole_easylist
/root/git/pihole_easylist/manual-easylist.sh

sleep 10

git add adblock_list/

sleep 10

 git commit -m "v1.4_$(date +"%Y-%m-%d") "
 git push

 exit 0
