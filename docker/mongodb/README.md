## Setup

Edit the config.

```bash
cp docker-compose.yml.example docker-compose.yml
cp add_user.js.example add_user.js
```

## Commands

* Start: `docker-compose up -d`
* Stop: `docker-compose stop`
* Remove: `docker-compose down`
* Debug: `docker-compose logs --follow owncloud`
* Add user: `mongo <IP>:<Port> < add_user.js`
