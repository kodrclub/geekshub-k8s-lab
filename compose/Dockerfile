FROM jenkinsci/blueocean

# Install kubectl from Docker Hub.
COPY --from=lachlanevenson/k8s-kubectl:v1.17.0 /usr/local/bin/kubectl /usr/local/bin/kubectl
