# Use the official PHP image with Apache
FROM php:8.2-fpm
EXPOSE 80
# Install necessary PHP extensions
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list \
  && sed -i 's|security.debian.org|archive.debian.org/|g' /etc/apt/sources.list \
  && sed -i '/updates/d' /etc/apt/sources.list

# copy contents into directory
COPY . /var/www/html

# Set appropriate permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Set working directory
WORKDIR /var/www/html
