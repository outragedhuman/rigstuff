timestamp="$(date '+%H:%M:%S') " 

sensors_data="$(sensors | sed -e '/Adapter/d' -e '/in/d' -e 's/[)(]//g' -e '/Vbat/d' \
-e 's/crit.*//' -e 's/low.*//' -e '/temp2/d' -e '/temp3/d' -e '/^k10temp-pci-00c3$/,$d' \
-e 's/temp.://' -e 's/C/C  |  /')"

echo $timestamp$sensors_data | tee -a /home/ubiq/sensors.log
