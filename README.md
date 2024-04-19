# Docker_XAMPP_Flask

## Build
To build the docker container, run the following command from the root of the project:
```
docker build -t flask_apache .
```

## Run
To run the docker container, run the following command, replacing the ports with the destination ports (e.g., -p 80:8080 would output the container's port 80 to host port 8080) you want to use:
```
docker run --name myContainerName -p 80:80 -p 443:443 flask_apache
```
