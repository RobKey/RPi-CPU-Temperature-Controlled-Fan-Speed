#!/bin/python3

from gpiozero import PWMLED
from time import sleep
from subprocess import PIPE, Popen
import subprocess

fan = PWMLED(17)
val = 0.25

def get_cpu_temp():
    tempFile = open( '/sys/class/thermal/thermal_zone0/temp' )
    cpu_temp = tempFile.read()
    tempFile.close()
    return float(cpu_temp)/1000

while True:
    subprocess.call(["clear"])
    cpu = get_cpu_temp()
    if cpu < 47 and cpu > 42:
            val = 0.28
    elif cpu > 47.1 and cpu < 52:
        val = 0.5
    elif cpu > 52.1 and cpu < 55:
        val = 0.7
    elif cpu > 55.1 and cpu < 58:
        val = 0.83
    elif cpu > 58.1:
            val = 1.0	
    elif cpu < 41:
            val = 0.0
    
    print ('CPU temp: ' , str(get_cpu_temp())[:-2], '°C', val)
    fan.value = val
    sleep(1)
    
    

