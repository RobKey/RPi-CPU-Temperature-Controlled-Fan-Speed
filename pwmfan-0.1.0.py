#!/bin/python3


from gpiozero import PWMLED
from time import sleep
from subprocess import PIPE, Popen
import subprocess

fan = PWMLED(22)
flag = 0
min = 42
coff = 0.5
dcmin = 0.25
max = 60

def get_cpu_temp():
    #tempFile = open( '/sys/class/thermal/thermal_zone0/temp' )
    #cpu_temp = tempFile.read()
    #tempFile.close()    
    #return float(cpu_temp)/1000
    cpu_temp = subprocess.check_output( ["/opt/vc/bin/vcgencmd", "measure_temp"] )
    t = str(cpu_temp)[7:-5]
    return float(t)

while True:
    #print("\033c")
    cpu = get_cpu_temp()
    var = cpu - min
    var = var / (max-min)
    if cpu > min-coff and cpu < min and flag == 1:
        var = dcmin
    if cpu > min and var < dcmin and var > 0:
        var=dcmin
        flag =1
    if cpu < min-coff:
        var = 0
        flag = 0
        
    if var < 0:
        var = 0
    if var > 1:
        var = 1
    fan.value = var
    #print('CPU temp:  ' , str(get_cpu_temp())[:5], 'C')
    #print('Duty cycle:' , str((int)(var*100)),'%')
    
    sleep(1)
    
