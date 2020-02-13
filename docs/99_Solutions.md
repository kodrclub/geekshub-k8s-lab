# Solución a ejercicios

# 06 

> BONUS -> Hacer esto mismo modificando el docker compose de jenkins para que se instale automáticamente kubectl

Crear un Dockerfile con este contenido:
```
FROM jenkinsci/blueocean

# Install kubectl from Docker Hub.
COPY --from=lachlanevenson/k8s-kubectl:v1.17.0 /usr/local/bin/kubectl /usr/local/bin/kubectl
```

modificar la línea
```
image: "jenkinsci/blueocean"
```
por 
```
build: .
```

ejecutar
```
docker-compose -f compose/jenkins.yml build 
docker-compose -f compose/jenkins.yml up 
```
