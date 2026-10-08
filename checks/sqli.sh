#!/bin/sh
# The REST API of the SQL injection exercise returns user 1 from the database (set up at start).
set -e
out=$(curl -fsS http://dvws/dvws/vulnerabilities/sqli/api.php/users/1)
echo "$out" | grep -q "Darth"
