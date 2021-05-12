#! /bin/bash
  
if [ -z ${VNCDESKTOP+x} ]; then
    echo "No VNC session detected. Starting UDock normally"
    ./udock "$@"
else
    echo "VNC session detected. Starting UDock with vglrun"
    /usr/bin/vglrun -ge -d :1.0 ./udock "$@"
fi
