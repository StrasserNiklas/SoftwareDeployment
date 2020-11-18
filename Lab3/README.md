The task consists of two parts. Both have the goal of setting up the software "Wordpress" with an external MySQL database using two docker containers, though in part 2 the containers have to be setup first.

# Part 1

In the directory of the docker-compose.yml file open a command line and enter the following command:

    docker-compose up -d

The "-d" stands for "detached", meaning that the composition of the two containers will run in the background.

# Part 2

Both the wordpress and the SQL container images will be based on `debian:jessie`.

## Wordpress container

The environment variables will be used by the `docker-entrypoint.sh`.

After updating the system, wordpress will be installed. Shipping with wordpress are other dependencies needed like PHP and Apache.

The `ENTRYPOINT ./docker-entrypoint.sh` sets the the file as the entrypoint of the application.

## SQL container

### init.sql

This file generates the database for wordpress.

### Dockerfile

First, the system is updated and SQL is installed. Afterwards neccessary environment variables are set.

The `ENTRYPOINT ./docker-entrypoint.sh` sets the the file as the entrypoint of the application.

### docker-entrypoint.sh

This script sets up the SQL config file using the environment variables from the Dockerfile. 

## Deployment

In the directory of the SQL dockerfile open a command line and enter the following command to build the container:

    docker build -t sql .

Do the same in the directory of the Wordpress dockerfile:

    docker build -t wp .

In the directory of the docker-compose.yml file open a command line and enter the following command:

    docker-compose up -d