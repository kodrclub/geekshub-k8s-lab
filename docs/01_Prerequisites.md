# Prerequisitos

En este lab vamos a configurar nuestras máquinas para poder seguir todos los paso del Lab.

## VirtualBox

En primer lugar necesitaremos descargarnos [Virtualbox 6.1](https://www.virtualbox.org/):

[Windows](https://download.virtualbox.org/virtualbox/6.1.2/VirtualBox-6.1.2-135663-Win.exe)
[Mac Os](https://download.virtualbox.org/virtualbox/6.1.2/VirtualBox-6.1.2-135662-OSX.dmg)
[Linux](https://www.virtualbox.org/wiki/Linux_Downloads)

Y seguimos las instrucciones necesarias para intalarla en nuestro sistema operativo.


## Clonar repositorio del Lab

```
git clone https://github.com/escarti/geekshub-k8s-lab.git
```

> Si queremos ahorrarnos algo de tiempo podemos guardar las credenciales usando 
```
git config --global credential.helper store
```


## Instalar Docker y Docker-Compose

### Docker

#### Linux 

https://wiki.alpinelinux.org/wiki/Docker#Installation

Debemos seguir las instrucciones que se detallan [aquí](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

Borrar versiones anteriores
```
sudo apt-get remove docker docker-engine docker.io
```

Actualizar Apt-get
```
sudo apt-get update
```

Instalar dependencias
```
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```

Añadir clave GPG 
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Añadir repositorio a apt-get
```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

Instalar Docker
```
{
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
}
```

Enable docker installation
```
sudo systemctl enable docker
sudo systemctl start docker 
```

Verificar instalación
```
sudo docker run hello-world
```

Para facilitarnos la vida añadiremos nuestro usuario al grupo de Docker
```
sudo usermod -aG docker your-user
```

> IMPORTANTE: Esto abre la posibilidad de [ATAQUES](https://docs.docker.com/engine/security/security/#docker-daemon-attack-surface)

Hacer log-out y log-in para que los cambios tengan efecto.
```
sudo pkill -u username
```

Verificar que todo esté en orden
```
docker run hello-world
```

#### Mac OS 

Seguir las instrucciones [aquí](https://docs.docker.com/docker-for-mac/install/)

#### Windows 

Seguir las instrucciones [aquí](https://docs.docker.com/docker-for-windows/install/)

### Docker compose

#### Linux 

Descargar docker compose
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

Añadir persmisos
```
sudo chmod +x /usr/local/bin/docker-compose
```

Añadir enlace simbólico
```
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

Verificar
````
docker-compose --version
````

#### MacOS 

Está incluído con Docker

#### Windows

Seguir las instrucciones [aquí](https://docs.docker.com/compose/install/)

> Este paso se puede automatizar en Linux usando el script [01_install_docerk.sh] (../scripts/01_install_docker.sh)

