FROM rockylinux:9.3
RUN dnf -y update && \
    dnf -y install openldap-clients && \
    dnf -y install bind-utils && \ 
    dnf -y install nmap && \
    dnf -y install httpd-tools
