# CONFIG ODBC CONNECTION
cat <<EOT > /etc/odbc.ini
[maxdb]
driver=/home/root/lib/libsdbodbc.so
ServerDB=$DB_NAME
ServerNode=$DB_HOST
pwd=$DB_PASSWORD
usr=$DB_USER
EOT

php-fpm