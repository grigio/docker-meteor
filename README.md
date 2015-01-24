# grigio/docker-meteor

![docker-meteor](https://cloud.githubusercontent.com/assets/8074/5562265/a3cba180-8e0e-11e4-8bab-9a0f6ec0a395.jpg)

This is a docker container image which use `node` provided by Meteor itself. You can use `grigio/meteor:<version>` as a development sandbox or as a base to build your production image for your project.

[![grigio meteor](http://dockeri.co/image/grigio/meteor)](https://hub.docker.com/u/grigio/meteor/)

The Meteor images available are on [Docker hub](https://registry.hub.docker.com/u/grigio/meteor/tags/manage/)


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
You need to build a `Dockerfile` based on `grigio/meteor-docker` an then run it.

```dockerfile
FROM grigio/meteor:1.0
MAINTAINER Your Name

# Add the source of your Meteor app and build
ADD ./demo /app 
RUN /meteor-build.sh

# Run the generated files
CMD /meteor-run.sh
```
```bash
❯ sudo docker build -t grigio/docker-meteor-demo .
```
```bash
❯ sudo docker run -e "MONGO_URL=mongodb://172.17.0.4:27017/mytest" \
  -e "ROOT_URL=http://example.com" -p 5555:8080 -it grigio/docker-meteor-demo sh /meteor-run.sh
```
..and the Meteor app starts in seconds :)

