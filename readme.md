## A heroku postgres for heroku commands with psql on command line


As the title mention we conkfigure a image with all necesary to make heroku commands with psql as command line

## Requirements

-  Ger docker [here](https://docs.docker.com/get-docker/)
- Make sure you can use comands as `$ docker --version`
- A big plus to have [VSCODE](https://code.visualstudio.com/download) but other is okay.

## Start the app

1. Build image
`$ docker-compose build`
2. Start image
 `$ docker-compose up -d`


## Util commands

- Build the new image and spin up the "n" containers:
`$ docker-compose up -d --build`


## Upgrade heroku databases

- Add follow db

`$ heroku addons:create heroku-postgresql:basic --follow HEROKU_POSTGRESQL_OLIVE_URL --app myapp`

```bash
Adding heroku-postgresql:standard-2 to myapp... done, v71 ($200/mo)
Attached as HEROKU_POSTGRESQL_WHITE
Follower will become available for read-only queries when up-to-date
Use `heroku pg:wait` to track status
```

`$ heroku pg:wait --app myapp`

`"Waiting for database HEROKU_POSTGRESQL_WHITE_URL... available"`

`$ heroku pg:info --app myapp`

```bash
=== HEROKU_POSTGRESQL_LAVENDER
Plan:        Standard 0
Status:      available
...
=== HEROKU_POSTGRESQL_WHITE
Plan:        Standard 2
Status:      available
...
Following:   HEROKU_POSTGRESQL_LAVENDER (DATABASE_URL)
Behind By:   125 commits
```

Wait for the follower database to fully catch up to the primary (as indicated by being behind by 0 commits).

`heroku pg:upgrade HEROKU_POSTGRESQL_WHITE --app myapp`

````bash
$ heroku pg:promote HEROKU_POSTGRESQL_WHITE --app myapp
Promoting HEROKU_POSTGRESQL_WHITE_URL to DATABASE_URL... done
```

If your original primary database was attached to multiple apps, you must attach your new database to those apps with heroku `addons:attach`.


Exit mode maintenance
`$ heroku maintenance:off --app prescrypto-development`
