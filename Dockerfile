FROM gcr.io/stacksmith-images/ubuntu:14.04-buildpack
MAINTAINER Bitnami <containers@bitnami.com>

LABEL com.bitnami.stacksmith.id="Sz6grp8" \
      com.bitnami.stacksmith.name="Ruby on Rails 3.2.22 on Ubuntu"

ENV STACKSMITH_STACK_ID="Sz6grp8" \
    STACKSMITH_STACK_NAME="Ruby on Rails 3.2.22 on Ubuntu"
ENV STACKSMITH_STACK_PRIVATE=1

# Runtime
RUN bitnami-pkg-install ruby-2.2.3-1

# Framework
RUN bitnami-pkg-install rails-3.2.22-0

# Runtime template
ENV PATH=/opt/bitnami/ruby/bin:$PATH

RUN mkdir -p /var/log/app_engine/custom_logs
RUN chown -R bitnami:bitnami /var/log/app_engine

ADD . /app
RUN chown -R bitnami:bitnami /app

USER bitnami

WORKDIR /app
RUN bundle install

EXPOSE 8080
CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0"]

