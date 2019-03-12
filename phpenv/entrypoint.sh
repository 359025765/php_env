#!/bin/sh

if [ -d "/home/php-env/.ssh" -a "$(id -u)" = '0' ]; then
    chown -R php-env:php-env /home/php-env/.ssh
#    exec gosu "$@"
fi

exec "$@"