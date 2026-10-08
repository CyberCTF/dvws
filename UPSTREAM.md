# Upstream

| | |
| --- | --- |
| Project | DVWS (Damn Vulnerable Web Services), PHP version |
| Repository | https://github.com/snoopysecurity/dvws (archived; successor: dvws-node) |
| Version | master (no releases) |
| Commit | 25a5a03aa1b13d8e647da66784c3e8445726e578 |
| Licence | Apache-2.0 (LICENSE file; the README still mentions GPL-3.0) |

`build/dvws/app/` is that commit, unchanged, without its Git history. Upstream has no Dockerfile:
`build/dvws/Dockerfile` follows its XAMPP setup (the folder served as `/dvws/`) on
`php:5.6-apache` (upstream asks for PHP 5.5.38, whose image no longer pulls), with the `mysqli`
and legacy `mysql` extensions; it changes the hardcoded database host `localhost` to `db` in the
copied files and sets `mysql.default_host = db`, and runs `setup-db.sh` in the background at
start, which posts DVWS's "Reset Database" once. `build/db/Dockerfile` is MariaDB 10.11 allowing
root with no password, as XAMPP. To update, replace `build/dvws/app/` with a newer commit, then
change this table.
