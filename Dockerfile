FROM nextcloud:stable-apache

RUN apt-get update; apt-get install -y --no-install-recommends ffmpeg

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]