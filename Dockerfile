FROM nextcloud:stable-apache

RUN apt-get update; apt-get install -y --no-install-recommends ffmpeg

ARG IFRAME_URL

RUN sed -i "s#protected \$allowedFrameAncestors = \[#protected \$allowedFrameAncestors = \[\n		'$IFRAME_URL',#g" /usr/src/nextcloud/lib/public/AppFramework/Http/ContentSecurityPolicy.php

ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]