ARG IMAGE_VERSION=2.0.0
FROM yuridefranca/nodejs:${IMAGE_VERSION}

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]