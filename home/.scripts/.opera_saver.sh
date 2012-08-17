#!/bin/bash
if [ `ps -ef | grep "opera -fullscreen" | grep -v grep | wc -l` -eq 0 ]
then
  opera -fullscreen &
  sleep 5
fi

while [ `ps -ef | grep "opera -fullscreen" | grep -v grep | wc -l` -gt 0 ]; do

  urls=$(cat ~/.scripts/.webscreen_pages)

  for i in $urls
  do
    opera -fullscreen -activetab -remote “openURL($i,noraise)”
    if [ $? -gt 0 ]; then
      echo “Something is wrong, bailing out….”
      killall opera
      exit 1
    fi
    sleep 15
  done
done
exit 0
