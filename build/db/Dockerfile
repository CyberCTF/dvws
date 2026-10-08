# The MySQL of DVWS's XAMPP setup, as MariaDB 10.11: DVWS connects as root with an empty password
# and creates its dvws database itself (Setup instructions page), so root may log in from the
# network with no password.
FROM docker.io/library/mariadb:10.11
ENV MARIADB_ALLOW_EMPTY_ROOT_PASSWORD=1
