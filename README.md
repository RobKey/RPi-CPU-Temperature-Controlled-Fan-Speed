# RPi-CPU-Temperature-Controlled-Fan-Speed
Raspberry pi 3 CPU temperature controlled fan speed</br >
tested on strecth, jessie and ubuntu mate 16.04.2 with 5V and 12V external PSU</br >
Warning do NOT connect a fan, motor, coil or relay with out back EMF protection diode to your pi</br >
Uses PWMLED function (pulse width modulation) a transistor, a resistor and diode to control fan</br >
min = on temperature, coff = off temprature min - coff, dcmin = minimum dutycycle fan will run at, max = temperature for 100% fan  </br > 
Pins BCM22(pin15) also tested on BCM17(pin11)</br >
fan.sh commands /etc/init.d/fan.sh start /etc/init.d/fan.sh stop, this file is placed in /etc/init.d owner root:root exacutable and set it to run at boot, edit the paths in fans.sh lines 16 and 23 for your location of pwmfan.0.1.0.py</br >
</br >
sudo chmod +x /etc/init.d/fan.sh</br >
sudo chown root:root /etc/init.d/fan.sh</br >
sudo update-rc.d /etc/init.d/fan.sh defaults</br ></br >
If you want to stop running at boot</br > 
sudo update-rc.d -f /etc/init.d/fan.sh remove </br > 

![alt text](https://github.com/RobKey/RPi-CPU-Temperature-Controlled-Fan-Speed/blob/master/fancct1.png)
