FROM ubuntu:latest

RUN apt-get update && apt-get install -y apache2 unzip wget

# Create web directory
RUN rm -rf /var/www/html/*

# Download template INSIDE container
RUN wget https://templatemo.com/download/templatemo_603_nexaverse -O /tmp/site.zip \
    && unzip /tmp/site.zip -d /tmp/site \
    && cp -r /tmp/site/* /var/www/html/

CMD ["apache2ctl", "-D", "FOREGROUND"]
