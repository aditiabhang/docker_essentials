## Lab 3: Summary

- Got introduced to problems that come with running containers in production, such as scheduling services across distributed nodes, maintaining high availability, implementing reconciliation, scaling, and logging. 
- Used the orchestration tool that comes built-in to the Docker Engine, Docker Swarm, to address some of these issues.

### Key points to remember:
- Docker Swarm schedules services by using a declarative language. You declare the state, and the swarm attempts to maintain and reconcile to make sure the actual state equals the desired state.
- Docker Swarm is composed of manager and worker nodes. Only managers can maintain the state of the swarm and accept commands to modify it. Workers have high scalability and are only used to run containers. By default, managers can also run containers.
- The routing mesh built into Docker Swarm means that any port that is published at the service level will be exposed on every node in the swarm. Requests to a published service port will be automatically routed to a container of the service that is running in the swarm.
- We can use other tools to help solve problems with orchestrated, containerized applications in production, including Docker Swarm and the IBM Cloud Kubernetes Service.