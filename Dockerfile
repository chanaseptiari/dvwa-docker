FROM docker.io/library/ubuntu:18.04

LABEL maintainer="chanaso"

ENV DEBIAN_FRONTEND=noninteractive

# envitorment for captcha
ENV recaptcha_public_key=''
ENV recaptcha_private_key=''

# Set default value security level
ENV default_security_level='low'

# Set default value of phpids level
ENV default_phpids_level='disabled'

# Set default value of phpids verbose
ENV default_phpids_verbose='false'

# Set default value of locale
ENV default_locale='en'

# Install Depedensi
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    apache2 \
    mariadb-server \
    php \
    php-mysqli \
    php-gd \
    libapache2-mod-php \
    git && \
    rm /var/www/html/index.html

# MariaDB root pasword 
RUN echo mariadb-server mysql-server/root_password password vulnerables | debconf-set-selections && \
    echo mariadb-server mysql-server/root_password_again password vulnerables | debconf-set-selections 

# Copy required files 
RUN git clone https://github.com/digininja/DVWA /var/www/html/

# COPY DVWA /var/www/html/
COPY config.inc.php /var/www/html/config/
COPY .env /var/www/html/config/
COPY php.ini /etc/php/7.2/apache2/php.ini
COPY php.ini /etc/php/7.2/cli/php.ini

# Change Owner Folder
RUN chown www-data:www-data -R /var/www/html

# Remove Unused Files
RUN apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Start Service and create user for mysql
RUN service mysql start && \
    sleep 1 && \
    mysql -uroot -pvulnerables -e "create database dvwa; create user dvwa@localhost identified by 'p@ssw0rd'; grant all on dvwa.* to dvwa@localhost; flush privileges;"

# Expose Port
EXPOSE 80

# Copy starting service file
COPY start.sh /
RUN chmod +x /start.sh

ENTRYPOINT [ "/start.sh" ]