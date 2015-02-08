FROM coreos/apache
MAINTAINER Sam Giles

RUN sudo apt-get update
RUN sudo apt-get install -y tar wget

RUN wget http://grafanarel.s3.amazonaws.com/grafana-1.9.1.tar.gz
RUN tar -xvf grafana-1.9.1.tar.gz
RUN mv grafana-1.9.1/* /var/www

ADD config.js /var/www/config.js

EXPOSE 80
CMD /usr/sbin/apachectl -D FOREGROUND

