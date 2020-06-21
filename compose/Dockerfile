FROM jenkins/jenkins:lts-alpine

USER root

RUN apk add --update docker openrc
RUN rc-update add docker boot

USER jenkins

# Install kubectl from Docker Hub.
COPY --from=lachlanevenson/k8s-kubectl:v1.17.0 /usr/local/bin/kubectl /usr/local/bin/kubectl
