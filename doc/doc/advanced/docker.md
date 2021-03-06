---
layout: default
title: Using DeepDive with Docker
---

# Using DeepDive with Docker

IMPORTANT: You need to be running a database on port 5432 that is accessible to your Docker container. [Postgres](https://registry.hub.docker.com/_/postgres/) or [MySQL](https://registry.hub.docker.com/_/mysql/)
are great options.

### Docker instructions

```bash
# Build and tag deepdive image
# You may specify 'dev' as the tag if you desire
docker pull adamwgoldberg/deepdive-github

# Run Deepdive
# All deepdive application code should be created in /root/deepdive/app
# Make sure the deepdive-github tag matches the above one.
# This assumes you have a db container named db.
docker run -t -d --link db:db --name deepdive adamwgoldberg/deepdive-github bash

# Attach shell to Deepdive
# You may need to wait several minutes for your database to initialize.
# The bash shell will block and say "Waiting for DB..." until it finishes.
# This may not be visible from viewing the logs outside of bash.
docker exec -ti deepdive bash

# Inside of that shell run:
cd ~/deepdive
make test
```

### Docker tips

* AWS EC2 m.xlarge on Virginia region using ami-84e897ec is a great place to start
* Ensure you have at least 20GB of storage
* Any machine with Docker installed should work fine
