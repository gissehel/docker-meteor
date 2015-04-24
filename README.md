# gissehel/docker-meteor (based on grigio/docker-meteor)

This is a docker container image which use `node` provided by Meteor itself. You can use `gissehel/meteor:<version>` as a development sandbox or as a base to build your production image for your project.

[![gissehel meteor](http://dockeri.co/image/gissehel/meteor)](https://hub.docker.com/u/gissehel/meteor/)

The Meteor images available are on [Docker hub](https://registry.hub.docker.com/u/gissehel/meteor/tags/manage/), original images on [grigio's docker hub page](https://registry.hub.docker.com/u/grigio/meteor/tags/manage/).

More info in a dedicated [post](http://grigio.org/meteor_and_docker_grigio_docker_meteor).

### Development mode
```shell
❯ sudo docker run -it -v $PWD/my-meteor-app:/app -p 1234:8080 grigio/meteor:1.0 /bin/bash
root@4bae180c01a0:/app# meteor --release $METEOR_RELEASE -p 8080
[[[[[ ~app ]]]]]                              

=> Started proxy.                             
=> Started MongoDB.                           
=> Started your app.                          

=> App running at: http://localhost:8080/
```

### Production mode
You need to build a `Dockerfile` based on `gissehel/meteor-docker` an then run it.

```dockerfile
FROM gissehel/meteor:1.1.0.2
MAINTAINER Your Name

# Add the source of your Meteor app and build
ADD ./demo /app 
RUN /meteor-build.sh

# Run the generated files
CMD /meteor-run.sh
```
```bash
❯ sudo docker build -t docker-meteor-demo .
```
```bash
❯ sudo docker run -e "MONGO_URL=mongodb://172.17.0.4:27017/mytest" \
  -e "ROOT_URL=http://example.com" -p 5555:8080 -it docker-meteor-demo sh /meteor-run.sh
```
..and the Meteor app starts in seconds :)

