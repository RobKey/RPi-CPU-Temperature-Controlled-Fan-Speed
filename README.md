# RPi-CPU-Temperature-Controlled-Fan-Speed
Raspberry pi 3 CPU temperature controlled fan speed</br >
tested on strecth, jessie and ubuntu mate 16.04.2 with 5V and 12V external PSU</br >
Uses PWMLED function (pulse width modulation) a transistor, a resistor and diode to control fan</br >
min = on temperature, coff = off temprature min - coff, dcmin = minimum dutycycle fan will run at, max = temperature for 100% fan  </br > 
Pins BCM22(pin15) also tested on BCM17(pin11)</br >
fan.sh commands /etc/init.d/fan.sh start /etc/init.d/fan.sh stop, this file is placed in /etc/init.d owner root:root exacutable and set it to run at boot</br >
</br >
![alt text](https://github.com/RobKey/RPi-CPU-Temperature-Controlled-Fan-Speed/blob/master/fancct.png)
