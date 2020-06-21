pipeline {
    /*
    *  agent {
    *    node {
    *      label 'DEBIAN8'
    *    }
    *  }
    */
    agent any
    triggers {
        pollSCM('* * * * */1')
    }
    options {
        disableConcurrentBuilds()
    }
    environment {
        registry = "escarti/geekshub-django"
        registryCredential = 'Docker'
        apiServer = "https://192.168.99.101:8443"
        devNamespace = "default"
        minikubeCredential = 'minikube-auth-token'
        imageTag = "${env.GIT_BRANCH + '_' + env.BUILD_NUMBER}"
    }
    stages {
        stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build(registry + ":$imageTag", "--cache-from $registry:latest --network host .")
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Upload to registry') {
            steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage('Deploy to K8s') {
            steps{
                withKubeConfig([credentialsId: minikubeCredential,
                                serverUrl: apiServer,
                                namespace: devNamespace
                               ]) {
                    sh 'kubectl set image deployment/django django="$registry:$imageTag" --record'
                }
            }
        }
    }
}