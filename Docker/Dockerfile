FROM wordpress:php8.2

ARG UNAME=www-data
ARG UGROUP=www-data
ARG GID=1000
ARG UID=1000
RUN groupmod --gid $GID $UGROUP
RUN usermod --uid $UID $UNAME

RUN apt update && apt install -y \
    curl \
    less \
    mariadb-client \
    subversion \
    unzip
#
# wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && echo "*** composer command installed"

USER $UNAME
