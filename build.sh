#!/bin/sh
LATEST=1.1.0.2
docker build -t gissehel/meteor:$LATEST .
docker push gissehel/meteor:$LATEST
