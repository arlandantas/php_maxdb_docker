# CONFIG ODBC CONNECTION
cat <<EOT > /etc/odbc.ini
[maxdb]
driver=/app/lib/libsdbodbc.so
servernode=$DB_HOST
pwd=$DB_PASSWORD
usr=$DB_USER
database=$DB_NAME
EOT

php-fpm