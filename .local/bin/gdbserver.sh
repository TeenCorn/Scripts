#!/bin/bash

CWD=$(pwd)
cd $CWD

termite --title=gdbserver -e 'gdbserver localhost:12345 bin/a.out' &
i3-msg 'exec gdbgui -x .gdbcmdfile'
