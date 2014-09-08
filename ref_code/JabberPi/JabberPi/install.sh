#!/bin/bash
ARCHIVE="JabberPi.tar.gz"
TARGET="JabberPi"
MAINPATH="/opt"
USER="root"
GROUP="root"
CURRENTPATH="$MAINPATH/$TARGET"

echo "Preparing files..."
        if [ ! -d $CURRENTPATH ]; then
		echo "Creating directory: $CURRENTPATH"
        	mkdir -p $CURRENTPATH
	fi
echo "Copying files."
 
tar -C $CURRENTPATH -zxf $ARCHIVE
chown -R $USER:$GROUP $CURRENTPATH
echo "Configuring."

CURRENTPATHSED="${CURRENTPATH//\//\\/}"

sed -e "s/__MAIN_PATH__/${CURRENTPATHSED}/" $CURRENTPATH/cfg/JabberProxy.config.tmpl > $CURRENTPATH/cfg/JabberProxy.config
sed -e "s/__MAIN_PATH__/${CURRENTPATHSED}/" $CURRENTPATH/cfg/JabberPi.config.tmpl > $CURRENTPATH/cfg/JabberPi.config
sed -e "s/__MAIN_PATH__/${CURRENTPATHSED}/" $CURRENTPATH/piJabberBot.tmpl  > $CURRENTPATH/piJabberBot
chmod 755 $CURRENTPATH/piJabberBot

sed -e "s/__MAIN_PATH__/${CURRENTPATHSED}/" $CURRENTPATH/init.d/piJabberBot.tmpl > /etc/init.d/piJabberBot
chmod 755 /etc/init.d/piJabberBot
chown root:root /etc/init.d/piJabberBot

sed -e "s/__MAIN_PATH__/${CURRENTPATHSED}/" $CURRENTPATH/cfg/JabberProxy_log4j.config.tmpl > $CURRENTPATH/cfg/JabberProxy_log4j.config
echo "Removing template files."
rm -f $CURRENTPATH/cfg/JabberProxy.config.tmpl
rm -f $CURRENTPATH/cfg/JabberPi.config.tmpl
rm -f $CURRENTPATH/piJabberBot.tmpl 
rm -f $CURRENTPATH/cfg/JabberProxy_log4j.config.tmpl
echo "**********************************************************************"
echo "* Thanks for installing JabberPi"
echo "* In order to use JabberPi you must edit following properties file:"
echo "* $CURRENTPATH/cfg/JabberProxy.config"
echo "* Optionally you can also check properties in following files:"
echo "* For logging settings:"
echo "* $CURRENTPATH/cfg/JabberProxy_log4j.config"
echo "* For additional JabberPi config:"
echo "* $CURRENTPATH/cfg/JabberPi.config"
echo "*"
echo "* To start:"
echo "* /etc/init.d/piJabberBot start"
echo "* To stop:"
echo "* /etc/init.d/piJabberBot stop"
echo "* To make it start with the system edit /etc/rc.local :"
echo "* sudo vim /etc/rc.local"
echo "* and add this line :"
echo "* /etc/init.d/piJabberBot start"
echo "**********************************************************************"
