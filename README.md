### ABOUT THIS COURSE

Containers are a standard way to package an application and all its dependencies so that the application can be moved between environments and run without changes. Containers work by isolating the application inside the container so that everything outside the container can be standardized.

Docker has provided a set of tools to simplify the use of containers. This has led to massive adoption of containers by developers and operators. In this course, you will focus mostly on Docker container technologies.

In this course, I performed a series of hands-on labs that demonstrate how to use containers for your applications. I started with the basics: creating and running your first Docker containers. By the end of the course, I got a brief introduction to running containers in production and how to solve problems of advanced orchestration such as high availability, service discovery, and reconciliation.

#### Tasks I learned and performed during the course. 

* Install and set up Docker

Lab 1: Run your first container
* What are containers?
    - Run a container
    - Run multiple containers
    - Remove the containers

Lab 2: Add CI/CD value with Docker images
* Docker images
    - Create a Python app (without using Docker)
    - Create and build the Docker image
    - Run the Docker image
    - Push to a central registry
    - Deploy a change
    - Understand image layers
    - Remove containers

Lab 3. Orchestrate applications with Docker Swarm Container orchestration overview
*   Create your first swarm
    - Deploy your first service
    - Scale your service
    - Apply rolling updates
    - Reconcile problems with containers
    - Determine how many nodes you need