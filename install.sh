#--------------------------------------------
# One-step setup
# 1. If docker-compose is already installed, then use it 
# 2. If docker-compse is not installed, then download a new one and use it 
# 
# author：jackie-1685@163.com
#--------------------------------------------
#!/bin/bash
echo "Start to startup the config-server compose"

function startupDockerCompose(){
	if type docker-compose &> /dev/null; then
		echo "docker-compose is exist, starting up applications..."
	else 
		echo "docker-compose is not exist, download docker-compose image and starting up applications..."
		docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD:/rootfs/$PWD" -w="/rootfs/$PWD" docker/compose:1.18.0 up
	fi
}

startupDockerCompose