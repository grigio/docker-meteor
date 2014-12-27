#!/bin/sh
LATEST=1.0.2.1
docker build -t grigio/meteor:$LATEST .
docker push grigio/meteor:$LATEST
