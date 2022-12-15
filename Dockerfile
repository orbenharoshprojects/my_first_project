FROM centos:latest
MAINTAINER orbenharoshprojects@gmail.com
RUN yum install -y httpd \
 zip\
 unzip
ADD https://www.free-css.com/assets/files/free-css-templaets/download/page254/phtogenic.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip phtogenic.zip 
RUN cp -rvf phtogenic/* .
RUN rm -rf phtogenic phtogenic.zip 
CMD ["user/sbin/httpd","-D", "FOREGROUND"]
EXPOSE 71
