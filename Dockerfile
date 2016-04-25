FROM php:5.4-apache

ENV KOHANA_ENV="" 

RUN a2enmod rewrite

RUN buildRequirements="libxml2-dev" \
	&& apt-get update && apt-get install -y ${buildRequirements} \
	&& docker-php-ext-install soap \
	&& apt-get purge -y ${buildRequirements} \
	&& rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install mysql

RUN apt-get update \
	&& apt-get install -y cron \
	&& rm -rf /var/lib/apt/lists/*
