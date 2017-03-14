FROM nginx:latest

ENTRYPOINT ["/bin/start.sh"]

ENV CONSUL_URL 127.0.0.1:8500
EXPOSE 80

#Install Curl
RUN apt-get update -qq && apt-get -y install curl

# Download mac release
ENV CT_URL https://releases.hashicorp.com/consul-template/0.18.1/consul-template_0.18.1_linux_amd64.tgz
RUN curl -O $CT_URL
RUN tar -C /usr/local/bin -zxvf consul-template_0.18.1_linux_amd64.tgz

COPY start.sh /bin/start.sh

# Setup consul template file
RUN mkdir /etc/consul-templates
COPY service.ctmpl /etc/consul-templates/service.ctmpl
ENV CT_FILE /etc/consul-templates/service.ctmpl

# Setup nginx file
ENV NX_FILE /etc/nginx/conf.d/app.conf




