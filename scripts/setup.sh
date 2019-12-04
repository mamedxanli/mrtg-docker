#!/bin/bash

#installing mrtg
#another line to test
apt install -y mrtg

echo "rocommunity public localhost" >> /etc/snmp/snmpd.conf

mkdir /var/www/mrtg

chown -R www-data:www-data /var/www/mrtg

cfgmaker centisp@172.16.0.1 >> /etc/mrtg.cfg
cfgmaker centisp@172.16.0.2 >> /etc/mrtg.cfg
cfgmaker centisp@172.16.0.3 >> /etc/mrtg.cfg
cfgmaker centisp@172.16.0.4 >> /etc/mrtg.cfg
cfgmaker centisp@172.16.0.5 >> /etc/mrtg.cfg
cfgmaker centisp@172.16.0.18 >> /etc/mrtg.cfg
cfgmaker centisp@172.16.0.19 >> /etc/mrtg.cfg
cfgmaker centisp@172.16.0.21 >> /etc/mrtg.cfg
cfgmaker centisp@172.16.0.254 >> /etc/mrtg.cfg

indexmaker /etc/mrtg.cfg > /var/www/mrtg/index.html

echo 'Alias /mrtg "/var/www/mrtg/"
<Directory "/var/www/mrtg/">
Options None
AllowOverride None
Require all granted
</Directory>' >> /etc/apache2/sites-available/mrtg.conf

a2ensite mrtg
service apache2 stop && service apache2 start
/usr/bin/mrtg /etc/mrtg.cfg
