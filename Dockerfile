FROM rockylinux:9.3
RUN dnf -y update && \
    dnf -y install openldap-clients  bind-utils nmap httpd-tools wget 
 
