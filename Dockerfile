FROM nginx:latest

ENV CONSUL_URL consul:8500

# Setup nginx start.sh
COPY start.sh /bin/start.sh

# Download mac release
ENV CT_URL https://releases.hashicorp.com/consul-template/0.18.1/consul-template_0.18.1_darwin_amd64.tgz
RUN curl -O $CT_URL
tar -C /usr/local/bin -zxvf consul-template_0.18.1_darwin_amd64.tgz

# Setup consul template file
RUN mkdir /etc/consul-templates
COPY service.ctmpl /etc/consul-templates/service.ctmpl
ENV CT_FILE /etc/consul-templates/service.ctmpl

# Setup nginx file
RUN rm -v /etc/nginx/conf.d/\*.conf
ENV NX_FILE /etc/nginx/conf.d/app.conf

# Start nginx and consul template
CMD /usr/sbin/nginx -c /etc/nginx/nginx.conf \
& CONSUL_TEMPLATE_LOG=debug consul-template \
  -consul=$CONSUL_URL \
  -template "$CT_FILE:$NX_FILE:/usr/sbin/nginx -s reload";



