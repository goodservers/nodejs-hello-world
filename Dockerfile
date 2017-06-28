FROM mhart/alpine-node:latest
MAINTAINER Tom Wagner <tomas.wagner@gmail.com>

# create workdir
RUN mkdir -p /app

# set workdir
WORKDIR /app

# install git
RUN apk add --update wget ca-certificates openssl openssh-client git tar

# install yarn
RUN npm install yarn -g

# Copy the code
ADD . .

# set entrypoint executable
RUN chmod 777 /app/entrypoint.sh

# port for API
EXPOSE 8000

# entrypoint
ENTRYPOINT ["sh", "/app/entrypoint.sh"]
