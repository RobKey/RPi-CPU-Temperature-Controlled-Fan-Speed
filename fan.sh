#!/bin/bash
### BEGIN INIT INFO
# Provides:          fan.sh
# Required-Start:    $remote_fs $python3
# Required-Stop:
# Should-Start:      fan.sh
# Default-Start:     2 3 4 5
# Default-Stop:      0 6
# X-Interactive:     true
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
    sudo kill $(ps aux | grep 'python3 /home/pi/workspace/FanSpeed/pwmfan-0.1.0.py' | awk 'NR==1{print $2}')
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
       echo $(ps aux | grep 'python3 /home/pi/workspace/FanSpeed/pwmfan-0.1.0.py' | awk '{print}')
       echo "End status." 
       ;;
    *)
       echo "Usage: $0 {start|stop|status|restart}"
esac

exit 0 
