


1. clone this repository
  ```
    git clone https://github.com/Bramas/hotcrp-docker-compose
    cd hotcrp-docker-compose
  ```
2. clone hotcrp repository 
  ```
    git clone https://github.com/kohler/hotcrp app
  ```
3. Rename `.env.default` to `.env` and edit the file as you wish
4. Rename `docker/php/msmtprc.default` to `docker/php/msmtprc` and edit the file to set up the SMTP connection (host, user and password). 
5. start docker-compose
  ```
  docker-compose up -d
  ```
6. Initialize the database
  ```
  docker-compose exec mysql  /bin/sh -c "echo 'ok\nhotcrp\nhotcrppwd\nn\nY\n' | sh /srv/www/api/lib/createdb.sh --user=root --password=root"
  ```
7. copy the default hotcrp configuration
  ```
  mv hotcrp-options.php app/conf/options.php
  ```
8. open `localhost:9001`


## More options

* To change the port, you can edit `docker-compose.yaml`
* you can change more options in the hotcrp config file: `app/conf/options.php`
* you can change or add custom php.ini options in `docker/php/php.conf`
* you can change or add custom nginx options in `docker/nginx/default.conf`




# Open bash terminal inside a container

```
docker-compose exec php /bin/bash
```


```
docker-compose exec mysql /bin/bash
```
particularly useful if you want to run mysql cli `mysql -p$MYSQL_ROOT_PASSWORD`