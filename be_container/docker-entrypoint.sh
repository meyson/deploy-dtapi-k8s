APP="/var/www/html/api"
sed -i -e "s|RewriteBase /|RewriteBase /api|g" "$APP/.htaccess"
sed -i -e "s|'base_url'   => '/'|'base_url'   => '/api/'|g" "$APP/application/bootstrap.php"
sed -i -e "s|localhost|$MYSQL_HOST|g" "$APP/application/config/database.php"

exec "$@"
