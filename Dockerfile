FROM rockylinux:8
LABEL Name="Ramesh"
RUN dnf install httpd -y
WORKDIR /var/www/html/
COPY /build/ .
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
