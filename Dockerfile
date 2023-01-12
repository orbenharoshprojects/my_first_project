FROM centos
MAINTAINER orbenharoshprojects@gmail.com

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y install java

ADD https://www.free-css.com/assets/files/free-css-templaets/download/page254/phtogenic.zip /var/www/html/
WORKDIR /var/www/html
RUN yum install unzip -y 
RUN unzip phtogenic.zip 
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic phtogenic.zip 
CMD ["user/sbin/httpd","-D", "FOREGROUND"]
EXPOSE 71 80 8080


