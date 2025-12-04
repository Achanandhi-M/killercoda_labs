# 🐳 Task 1: Build and Run a Dockerized Application

In this task, you will learn how to use Docker with a real application that already includes a Dockerfile. Your job is simple: clone the project, build the Docker image, and run the container.

---

## Step 1: Clone the Repository

First, download the project:

```
git clone https://github.com/Achanandhi-M/docker_demo
cd docker_demo
```

## Step 2: Build the Docker Image

Use Docker to build the image from the existing Dockerfile:
```
docker build -t docker-demo .
```
This creates an image named docker-demo.


## Step 3: Run the Container

Now run the application:

```
docker run -p 5000:5000 docker-demo
```

This maps port 5000 inside the container to port 5000 on your machine.

