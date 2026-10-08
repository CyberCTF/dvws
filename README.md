# DVWS (PHP)

[DVWS](https://github.com/snoopysecurity/dvws) (Damn Vulnerable Web Services) by snoopysecurity:
the original PHP version, an insecure web application with vulnerable web service components
(SOAP, XML-RPC, JSON-RPC, REST): WSDL enumeration, XXE, XML bomb, XPath injection, command
injection, SSRF, REST SQL injection, JWT secret brute force, CORS and more. Upstream now points to
its successor, [DVWS-node](https://github.com/snoopysecurity/dvws-node). This repository runs it
with [Isoloom](https://www.isoloom.com): [`isoloom.yml`](isoloom.yml) describes the machines, and
the upstream source in [`build/dvws/app/`](build/dvws/app) is served by a PHP 5.6 / Apache image
written for it (upstream ships no Dockerfile), with the database created at first start.

| Machine | Service |
| --- | --- |
| dvws | DVWS (PHP 5.6, Apache) on port 80, published on 8026 |
| db | MariaDB 10.11 on port 3306 |

## Run it

```bash
isoloom generate
isoloom up docker
```

Then open http://localhost:8026/dvws/. The database is already created ("Setup instructions"
resets it); pick an exercise in the side menu. The same spec runs as Docker on a local VM
(`docker-vm`), on a cloud VM (`cloud-docker`) or on Kubernetes. Lab guide: the
[DVWS README](https://github.com/snoopysecurity/dvws#readme) and the hint on each exercise page.

Upstream version and commit: [UPSTREAM.md](UPSTREAM.md).

## Licence

Apache-2.0, as DVWS ([LICENSE](LICENSE)). This application is deliberately vulnerable: keep it
isolated.
