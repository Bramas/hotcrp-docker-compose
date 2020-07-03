
FROM php:7.4-fpm
 
RUN docker-php-ext-install mysqli


RUN apt-get update && \
    apt-get install -y \
        zlib1g-dev libzip-dev

RUN apt-get install -y -q --no-install-recommends \
		msmtp


RUN docker-php-ext-install zip

# And clean up the image

RUN rm -rf /var/lib/apt/lists/*


