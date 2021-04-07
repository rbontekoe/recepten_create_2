FROM nginx

RUN mkdir -p /etc/nginx/ssl && \
    chmod 766 /etc/nginx/ssl
    
COPY ./req.cnf /

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/self.key -out /etc/nginx/ssl/self.crt -config req.cnf

COPY ./nginx.conf /etc/nginx/nginx.conf
