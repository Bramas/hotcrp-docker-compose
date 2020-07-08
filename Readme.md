


1. clone this repository
  ```
    git clone https://github.com/Bramas/hotcrp-docker-compose
    cd hotcrp-docker-compose
  ```
2. clone hotcrp repository 
  ```
    git clone https://github.com/kohler/hotcrp app
  ```
3. Rename `.env.default` to `.env` and edit the file as you wish (in particular set up the SMTP connection information: host, user and password)
4. start docker-compose
  ```
  docker-compose up -d
  ```
5. Initialize the database (or use a backup)
  ```
  docker-compose exec mysql  /bin/sh -c "echo 'ok\nhotcrp\nhotcrppwd\nn\nY\n' | sh /srv/www/api/lib/createdb.sh --user=root --password=root"
  ```
6. copy the default hotcrp configuration
  ```
  mv hotcrp-options.php app/conf/options.php
  ```
7. open `localhost:9001`


## More options

* If you want to print the deadline in another timezone (default is HST), edit `docker/php/php.conf` (need to restart) (list of php timezones: https://www.php.net/manual/en/timezones.php)
* To change the port, you can edit `docker-compose.yaml` (need to restart)
* You can change more options in the hotcrp config file: `app/conf/options.php` (no need to restart)
* You can change or add custom php.ini options in `docker/php/php.conf` (need to restart)
* You can change or add custom nginx options in `docker/nginx/default.conf` (need to restart)


## Backups and Restore

Perform a backup:
```
docker-compose exec -T mysql mysqldump -uroot -proot hotcrp > backup.sql
```

To restore:
```
docker-compose exec -T mysql mysql -uroot -proot hotcrp < backup.sql
```

### Backup to S3
configure aws cli with your credentials:
```
docker run --rm -it -v aws:/root/.aws -v $(pwd):/aws amazon/aws-cli configure
```

then run the following when you want to do a backup:
```
sh s3-backup.sh
```



## Update Hotcrp
As said in the hotcrp readme, you can update your hotcrp installation just by running `git pull` inside the app folder.


## Open bash terminal inside a container

```
docker-compose exec php /bin/bash
```


```
docker-compose exec mysql /bin/bash
```
particularly useful if you want to run mysql cli `mysql -proot`
