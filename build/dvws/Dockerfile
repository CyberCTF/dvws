# DVWS ships no Dockerfile (upstream: copy the dvws folder into a XAMPP htdocs, served as
# /dvws/). This image does that on PHP 5.6 with Apache (upstream asks for PHP 5.5.38, whose
# official image no longer pulls): the source from app/ goes to /var/www/html/dvws/, its
# hardcoded database host 'localhost' is changed to the db machine in the copied files (the
# account stays root with no password; the legacy mysql_* calls that pass no host get it from
# mysql.default_host), / redirects to /dvws/, and the command first starts
# setup-db.sh in the background, which runs DVWS's "Reset Database" once so the lab starts ready.
FROM docker.io/library/php:5.6-apache

RUN docker-php-ext-install mysqli mysql \
 && printf 'mysql.default_host = db\nmysql.default_user = root\n' > /usr/local/etc/php/conf.d/dvws.ini

COPY --chown=www-data:www-data app/ /var/www/html/dvws/
RUN grep -rl "mysqli.*'localhost', 'root'" /var/www/html/dvws | xargs sed -i "s/'localhost', 'root'/'db', 'root'/g" \
 && ! grep -rn "mysqli.*localhost" /var/www/html/dvws \
 && printf '<?php header("Location: /dvws/");\n' > /var/www/html/index.php

COPY setup-db.sh /usr/local/bin/dvws-setup-db
CMD ["sh", "-c", "sh /usr/local/bin/dvws-setup-db & exec apache2-foreground"]
