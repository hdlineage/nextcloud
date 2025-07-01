FROM nextcloud:stable-apache

RUN apt-get update; apt-get install -y --no-install-recommends ffmpeg

RUN sed -i "s#protected \$allowedFrameAncestors = \[#protected \$allowedFrameAncestors = \[\n		'$IFRAME_URL',#g" ./ContentSecurityPolicy.php


ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]