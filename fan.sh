#!/bin/bash
### BEGIN INIT INFO
# Provides:          fan.sh
# Required-Start:    $remote_fs
# Required-Stop:
# Should-Start:      fan.sh
# Default-Start:     2 3 4 5
# Default-Stop:
# X-Interactive:     false
# Short-Description: CPU temperature controlled fan.
### END INIT INFO

start() {
    # code to start app comes here 
    # example: daemon program_name &
    python3 /home/pi/workspace/FanSpeed/pwmfan-0.1.0.py &
    #sleep 2    
    echo "pwnfan-0.1.0.py Started"
}

stop() {
    # code to stop app comes here 
    sudo kill $(ps aux | grep 'python3 /home/pi/workspace/FanSpeed/pwmfan-0.1.0.py' | awk '{print $2}')
    echo "pwnfan-0.1.0.py Stopped"
}

case "$1" in 
    start)
       start
       ;;
    stop)
       stop
       ;;
    restart)
       stop
       start
       ;;
    status)
       # code to check status of app comes here 
       # example: status program_name
       ;;
    *)
       echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0 
