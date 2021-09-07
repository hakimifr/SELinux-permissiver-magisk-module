while [ "$(getprop sys.boot_completed | tr -d '\r')" != "1" ]; do sleep 1; done # stolen from YouTube Vanced script
sleep 1
setenforce 0
