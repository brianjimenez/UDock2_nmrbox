#! /bin/bash
ORIGIN=$(dirname $(readlink -f $0))
cd $ORIGIN

if [ -z ${DISPLAY+x} ]; then
	2>&1 echo "UDock requires graphical display"
	exit 1
fi
  
if [ -z ${VNCDESKTOP+x} ]; then
    echo "No VNC session detected. Starting UDock normally"
    ./udock "$@"
else
	if [ ! -e /usr/bin/nvidia-smi ]; then
		2>&1 echo "UDock requires GPU"
		exit 2
fi
    echo "VNC session detected. Starting UDock with vglrun"
    /usr/bin/vglrun -ge -d $DISPLAY ./udock "$@"
fi
