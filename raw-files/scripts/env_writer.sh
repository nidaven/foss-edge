ENVFILE="../.env"

echo "
Overwriting existing .env file
"
echo 'Setting Local Messaging Engine Configuration'
echo "======================================================="
echo '# Local Broker configuration variables
-----------------------------------------------
' > ${ENVFILE}
read -p 'Username: ' localbrokeruser
echo "LOCALMQTTUSER=$localbrokeruser" >> ${ENVFILE}
read -sp 'Password: ' localbrokerpass
echo "LOCALMQTTPASS=$localbrokerpass" >> ${ENVFILE}
echo "
"
echo 'Setting Cloud Messaging Engine Configuration
======================================================='
read -p 'Enter Cloud Server IP address & Broker Port
format -> IP:PORT : ' ip_addr_port
read -p 'Username: ' cloudbrokeruser
read -sp 'Password: ' cloudbrokerpass
ip="$( echo $ip_addr_port | cut -d ':' -f1 )"
port="$( echo $ip_addr_port | cut -d ':' -f2 )"
echo '
# MQTT Cloud configuration variables
-----------------------------------------------------
' >> ${ENVFILE}
echo "CLOUDMQTTIP=$ip" >> ${ENVFILE}
echo "CLOUDMQTTPORT=$port" >> ${ENVFILE} 
echo "CLOUDMQTTUSER=$cloudbrokeruser" >> ${ENVFILE}
echo "CLOUDMQTTPASS=$cloudbrokerpass" >> ${ENVFILE}
echo "
"
echo 'Setting OPCUA COnfiguration'
echo "======================================================="
read -p 'Enter OPCUA Server IP address & port - 
format -> IP:PORT : ' opcua_addr_port
read -p 'Username: ' opcuser
read -sp 'Password: ' opcpass
opcip="$( echo $opcua_addr_port | cut -d ':' -f1 )"
opcport="$( echo $opcua_addr_port | cut -d ':' -f2 )"
echo "
# OPCUA connection data
---------------------------------------------
" >> ${ENVFILE}
echo "OPCHOSTNAME=$opcip" >> ${ENVFILE}
echo "OPCPORT=$opcport" >> ${ENVFILE} 
echo "LOCALOPCUSER=$opcuser" >> ${ENVFILE}
echo "LOCALOPCPASS=$opcpass" >> ${ENVFILE}
echo "
"
echo 'Setting Database Configuration
=======================================================
'
read -p 'Username: ' databaseuser
read -sp 'Password: ' databasepass
echo ""
read -p 'Organisation name: ' databaseorg
read -p 'Bucket name: ' databasebucket
# read -sp 'Token: ' databasetoken
databasetoken=$(date +%s | sha256sum | base64 | head -c 32 ; echo;)
echo "
# Influxdb configuration data 
-------------------------------------------------
" >> ${ENVFILE}
echo "DOCKER_INFLUXDB_INIT_USERNAME=$databaseuser" >> ${ENVFILE}
echo "DOCKER_INFLUXDB_INIT_PASSWORD=$databasepass" >> ${ENVFILE}
echo "DOCKER_INFLUXDB_INIT_ORG=$databaseorg" >> ${ENVFILE}
echo "DOCKER_INFLUXDB_INIT_BUCKET=$databasebucket" >> ${ENVFILE}
echo "DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=$databasetoken" >> ${ENVFILE}
echo "
=======================================================
ENVIRONMENT FILE PREPARED
=======================================================
"
