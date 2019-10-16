ARG base_image
ARG go_version=latest

FROM golang:${go_version} as helpers

RUN go get github.com/GoogleCloudPlatform/docker-credential-gcr
RUN go get github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login
RUN go get github.com/Azure/acr-docker-credential-helper/src/docker-credential-acr

FROM ${base_image}

# Install packages that we want to make available at build time
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

# Yarn instalation -- https://yarnpkg.com/lang/en/docs/install/#debian-stable
# Yarn requires 1.11.x nodejs installed
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get -qq -y update && apt-get -qq -y install yarn nodejs rsync unzip

COPY --from=helpers /go/bin /usr/local/bin

ARG stack_id

USER www-data
LABEL io.buildpacks.stack.id=${stack_id}
ENV CNB_STACK_ID=${stack_id}
