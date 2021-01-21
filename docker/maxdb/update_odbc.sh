# CONFIG ODBC CONNECTION
cat <<EOT > /etc/odbc.ini
[smart_maxdb]
driver=/usr/sap/hdbclient/libodbcHDB.so
servernode=$DB_HOST
pwd=$DB_PASSWORD
usr=$DB_USER
database=$DB_NAME
EOT