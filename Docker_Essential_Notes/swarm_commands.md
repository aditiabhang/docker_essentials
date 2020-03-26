## Creating Swarm
- To initiate swarm master, and its token to koin other members.
```$ docker swarm init --advertise-addr eth0 ```

    Here,
    
    - ```docker swarm init``` : initiates swarm
    - ```--advertise-addr``` : option specifies the address in which the other nodes will use to join the swarm.
    
- To join the master.
```
$ docker swarm join \ --token SWMTKN-1-50qba7hmo5exuapkmrj6jki8knfvinceo68xjmh322y7c8f0pj-87mjqjho30uue43oqbhhthjui \
```
- On both node2 and node3, copy and run the docker swarm join command that was outputted to your console by the last command.
- You now have a three-node swarm!
- Back on node1, run docker node ls to verify your three-node cluster: 
```$ docker node ls```
- This command outputs the three nodes in your swarm. The asterisk (*) next to the ID of the node represents the node that handled that specific command (docker node ls in this case)
