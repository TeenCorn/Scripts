#!/bin/bash

CWD=$(pwd)
cd $CWD
echo 'target remote localhost:12345' > dummy
echo 'b main' >> dummy
echo 'continue' >> dummy

termite --title=gdbserver -e 'gdbserver localhost:12345 a.out' &
sleep 0.2
i3-msg 'exec gdbgui -x dummy'
