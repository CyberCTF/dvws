#!/bin/sh
# Runs DVWS's "Reset Database" (Setup instructions page) once Apache and the database answer, so
# the lab starts ready. Skipped when the users table already exists, so a restart keeps the
# database as the player left it.
users_table() {
  php -r '$c=@new mysqli("db","root","","dvws"); exit(!$c->connect_errno && $c->query("SELECT 1 FROM users LIMIT 1") ? 0 : 1);' 2>/dev/null
}
for i in $(seq 1 150); do
  if users_table; then echo "dvws-setup-db: database ready"; exit 0; fi
  curl -fsS -o /dev/null --data "create_db=Reset Database" http://127.0.0.1/dvws/instructions.php 2>/dev/null
  sleep 2
done
echo "dvws-setup-db: database setup failed"; exit 1
