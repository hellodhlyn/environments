#!/bin/bash
docker build -t ubuntu-env .
docker run --rm ubuntu-env
