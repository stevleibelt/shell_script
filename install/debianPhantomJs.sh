#!/bin/sh
########
# Script to install phantomjs on debian system
#
# @author stev leibelt
# @since 2013-04-05
########

#install dependencies
sudo apt-get update
sudo apt-get install libqt4-dev qt4-qmake xvfb xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic

#configure dependencies
sudo cat > /etc/init.d/Xvfb <<XVFBHEREDOC
### BEGIN INIT INFO
# Provides: 		Xvfb
# Required-Start: 	$local_fs $remote_fs
# Required-Stop:	$local_fs $remote_fs
# Default-Start: 	2 3 4 5
# Default-Stop: 	0 1 6
### END INIT INFO
 
XVFB=/usr/bin/Xvfb
XVFBARGS=":0 -screen 0 1024x768x24 -fbdir /var/run -ac"
PIDFILE=/var/run/xvfb.pid
case "$1" in
  start)
    echo -n "Starting virtual X frame buffer: Xvfb"
    start-stop-daemon --start --quiet --pidfile $PIDFILE --make-pidfile --background --exec $XVFB -- $XVFBARGS
    echo "."
    ;;
  stop)
    echo -n "Stopping virtual X frame buffer: Xvfb"
    start-stop-daemon --stop --quiet --pidfile $PIDFILE
    echo "."
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
        echo "Usage: /etc/init.d/xvfb {start|stop|restart}"
        exit 1
esac
 
exit 0
XVFBHEREDOC

sudo chmod 755 /etc/init.d/Xvfb
sudo update-rc.d Xvfb defaults
sudo /etc/init.d/Xvfb start

#get phantomjs
mkdir -p /tmp/debianPhantomJs/
cd /tmp/debianPhantomJs/
git clone https://github.com/ariya/phantomjs .

#make phantomjs
qmake-qt4 && make

#install it to hostsystem
sudo cp ~/src/phantomjs/bin/phantomjs /bin/
