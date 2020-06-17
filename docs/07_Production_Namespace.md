# Production Namespace

Como minikube es mono-cluster, vamos a simular varios entornos a través de "Namespaces"

## Crear el Namespace

Podemos usar 
```
kubectl create namespace production
```

o creamos un archivo "production-namespace.yaml" con el siguiente contenido:

```
cat > ./production-namespace.yaml <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: production
  labels:
    name: production
EOF
}
```

y aplicamos
```
kubectl apply -f deployments/production-namespace.yaml
```

> Aunque parezca una tontería, siempre es mejor tener archivos porque así documentamos de paso

> EJERCICIO: Poner en funcionamiento el entorno de producción

1. Crear repo de deployment de producción
2. Hacer deploy de secrets y BBDD en producción
3. Crear y configurar el accesso de Jenkins
4. Adaptar Jenkins Pipeline para rama master
5. Verificar que los despliegues funcionan
