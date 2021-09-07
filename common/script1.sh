while [ "$(getprop sys.boot_completed | tr -d '\r')" != "1" ]; do sleep 1; done
sleep 1
setenforce 0