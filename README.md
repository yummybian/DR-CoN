#DR CoN: Scalable Architecture using Docker, Registrator, Consul, Consul Template and Nginx

Build with:

```
docker build -t drcon .;
```

Run with:

```
docker run --rm --name=drcon --net="host" -it -p 8080:80 drcon
```

`CONSUL` is the location of your Consul service, `SERVICE` is the query sent to consul which will be distributed across.

# Read more [here](http://www.maori.geek.nz/post/scalable_architecture_dr_con_docker_registrator_consul_nginx)

