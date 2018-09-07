#!/bin/bash

# Install jack1, pulseaudio-module-jack, git clone and make jack2, get the devel files & configure via waf
# Git clone cadence as well
# Go into lightdm settings and activate pam_limits.so

ENV_DIR=$HOME/env/git

init-setup-jack () {
	cd ~/
	sudo eopkg up && sudo eopkg it -c system.devel jack-audio-connection-kit pulseaudio-module-jack
}

# Get devel files for jack2
jack2-devel-setup () {
	sudo eopkg it qt5-base-devel celt-devel libsndfile-devel alsa-lib-devel dbus-devel expat-devel libsamplerate-devel readline-devel systemd-devel
	mkdir git && cd git
	git clone https://github.com/jackaudio/jack2.git && cd jack2
}

# Configure waf
waf-conf () {
	./waf configure --dbus --enable-pkg-config-dbus-service-dir --prefix=/usr/ --libdir=/usr/lib/jack2
	./waf build
	sudo ./waf install
}

# Need to do this to obtain real time scheduling & unlimited memory. Solus quirk!
pam-workaround () {
	sudo echo "session   required pam_limits.so" >> /etc/pam.d/lightdm
}

init-setup-cadence () {
	cd $ENV_DIR
	git clone https://github.com/falkTX/Cadence.git
	sudo eopkg it python3-dbus
}

cadence-make () {
	cd Cadence
	make PREFIX=/usr
	sudo make install
}

init-setup-jack
jack2-devel-setup
waf-conf
pam-workaround
init-setup-cadence
cadence-make
