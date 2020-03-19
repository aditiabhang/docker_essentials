## Deploy your first service
- Now that you have your three-node Swarm cluster initialized, you'll deploy some containers. To run containers on a Docker Swarm, you need to create a service. 
- A service is an abstraction that represents multiple containers of the same image deployed across a distributed cluster.
- Let's do a simple example using NGINX. For now, you will create a service with one running container, but you will scale up later.
- Deploy a service by using NGINX:

/```$ docker service create --detach=true --name nginx1 --publish 80:80  --mount source=/etc/hostname,target=/usr/share/nginx/html/index.html,type=bind,ro nginx:1.12
pgqdxr41dpy8qwkn6qm7vke0q```

1. This command statement is declarative, and Docker Swarm will try to maintain the state declared in this command unless explicitly changed by another docker service command. This behavior is useful when nodes go down, for example, and containers are automatically rescheduled on other nodes. You will see a demonstration of that a little later in this lab.
    - The ***--mount*** flag is useful to have NGINX print out the hostname of the node it's running on. 
    - You will use this later in this lab when you start load balancing between multiple containers of NGINX that are distributed across different nodes in the cluster and you want to see which node in the swarm is serving the request.
    - You are using NGINX tag 1.12 in this command. 
    - You will see a rolling update with version 1.13 later in this lab.
    - The ***--publish*** command uses the swarm's built-in routing mesh. In this case, port 80 is exposed on every node in the swarm. The routing mesh will route a request coming in on port 80 to one of the nodes running the container.
    - Inspect the service.  Use the command docker service ls to inspect the service you just created:
```$ docker service ls```
```
ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
pgqdxr41dpy8        nginx1              replicated          1/1                 nginx:1.12          *:80->80/tcp
```
2. Check the running container of the service.
- To take a deeper look at the running tasks, use the command ***docker service ps***. A task is another abstraction in Docker Swarm that represents the running instances of a service. In this case, there is a 1-1 mapping between a task and a container.
```$ docker service ps nginx1```
```
ID                  NAME                IMAGE               NODE                DESIRED STATE       CURRENT STATE           ERROR               PORTS
iu3ksewv7qf9        nginx1.1            nginx:1.12          node1               Running             Running 8 minutes ago
```
- If you know which node your container is running on (you can see which node based on the output from docker service ps), you can use the command docker container ls to see the container running on that specific node.
- Test the service. Because of the routing mesh, you can send a request to any node of the swarm on port 80. This request will be automatically routed to the one node that is running the NGINX container.
Try this command on each node:
```
$ curl localhost:80
node1
```
- Curling will output the hostname where the container is running. For this example, it is running on node1, but yours might be different.
