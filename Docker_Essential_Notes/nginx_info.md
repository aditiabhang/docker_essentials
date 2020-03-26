## Creating NGINX server
- To launch an instance of NGINX running in a container and using the default configuration.

    ```docker run --name mynginx1 -P -d nginx```

    - This command creates a container named **mynginx1** based on the NGINX image and runs it in detached mode, meaning the container is started and stays running until stopped but does not listen to the command line.
    - he NGINX image exposes ports 80 and 443 in the container and the -P option tells Docker to map those ports to ports on the Docker host that are randomly selected from the range between 49153 and 65535. 
    - We do this because if we create multiple NGINX containers on the same Docker host, we create a conflict on ports 80 and 443. The port mappings are dynamic and are set each time the container is started or restarted. If you want the port mappings to be static, set them manually with the -p option. The long form of the Container Id will be returned.
- To verify that the container was created and is running, and to see the port mappings:
```$ docker ps```
- To verify that NGINX is running by making an HTTP request to port 49167 (reported in the output); default NGINX welcome page appears: 
```$ curl http://localhost:49167```

- Visit the link for more details on running NGINX:
```https://www.docker.com/blog/tips-for-deploying-nginx-official-image-with-docker/```

## Create nginx service:
- To create an NGINX service
```docker service create --detach=true --name nginx --publish 80:80 --mount```
    - ***--mount*** prints out the host name of the node that is running on.
    - Useful when multiple nodes are servicing that request.
- To inspect your service:
```docker service ls```
- Check out the running container
```docker service ps nginx```
- To update service and make its replicas
```docker service update --replicas=5 --detach=true nginx1```
- Checking the running service
```docker service ps nginx1```
- To check the request is running by which container on which node
```curl localhost: 80```
- Watch the services running in real time, -n to see updates every second. To watch the reconciliation in action.
```watch -n 1 docker service ps nginx```
