FROM php:7.2-fpm

ARG DB_HOST
ARG DB_PASSWORD
ARG DB_USER
ARG DB_NAME
ENV DB_HOST $DB_HOST
ENV DB_PASSWORD $DB_PASSWORD
ENV DB_USER $DB_USER
ENV DB_NAME $DB_NAME

# Copy composer.lock and composer.json
# COPY composer.lock composer.json /var/www/

# Set working directory
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libgmp-dev \
    cron \
    procps

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install extensions
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl gmp
RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/
RUN docker-php-ext-install gd

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN service cron start
RUN update-rc.d cron enable

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN sed -i 's/post_max_size \= .M/post_max_size \= 200M/g' "$PHP_INI_DIR/php.ini" && \
    sed -i 's/upload_max_filesize \= .M/upload_max_filesize \= 200M/g' "$PHP_INI_DIR/php.ini"

RUN apt-get update && apt-get install unixodbc unixodbc-dev -y \
 && docker-php-ext-configure pdo_odbc --with-pdo-odbc=unixODBC,/usr \
 && docker-php-ext-install pdo_odbc

COPY docker/lib/ /home/root/
COPY docker/init_php.sh /home/root/
# RUN /home/root/init_php.sh

# COPY docker/maxdb /installation
# RUN /installation/init.sh
# RUN rm -rf /installation

# Expose port 9000 and start php-fpm server
EXPOSE 9000
# CMD ["php-fpm"]
CMD ["sh /home/root/init_php.sh"]
