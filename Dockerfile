## BUILDING
##   (from project root directory)
##   $ docker build -t prydonius-managedvm-hello-world .
##
## RUNNING
##   $ docker run -p 3000:3000 prydonius-managedvm-hello-world
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:3000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/debian-buildpack:wheezy-r07

MAINTAINER Bitnami <containers@bitnami.com>

LABEL com.bitnami.stacksmith.id="pl41ogn" \
      com.bitnami.stacksmith.name="prydonius/managedvm-hello-world"

ENV STACKSMITH_STACK_ID="pl41ogn" \
    STACKSMITH_STACK_NAME="prydonius/managedvm-hello-world" \
    STACKSMITH_STACK_PRIVATE="1"

# Runtime
RUN bitnami-pkg install ruby-2.3.1-1 --checksum a81395976c85e8b7c8da3c1db6385d0e909bd05d9a3c1527f8fa36b8eb093d84

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Runtime template
ENV PATH=/opt/bitnami/ruby/bin:$PATH

RUN mkdir -p /var/log/app_engine/custom_logs
RUN chown -R bitnami:bitnami /var/log/app_engine

COPY . /app
RUN chown -R bitnami:bitnami /app
USER bitnami
WORKDIR /app

RUN bundle install

EXPOSE 8080
CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0"]
