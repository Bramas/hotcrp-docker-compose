


1. clone this repository
  ```
    git clone https://github.com/Bramas/hotcrp-docker-compose
    cd hotcrp-docker-compose
  ```
2. clone hotcrp repository 
  ```
    git clone https://github.com/kohler/hotcrp app
  ```
3. Edit the `.env` as you wish
4. Edit the file `docker/php/msmtprc` to set up the SMTP connection (host, user and password).
5. start docker-compose
  ```
  docker-compose up -d
  ```
6. open `localhost:9001`


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