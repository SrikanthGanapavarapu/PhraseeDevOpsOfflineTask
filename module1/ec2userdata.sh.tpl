#! /bin/bash
##Install and start Docker
sudo yum install docker -y
sudo usermod -a -G docker ec2-user
id ec2-user
newgrp docker
sudo systemctl enable docker.service
sudo systemctl start docker.service

##Copy file from S3 to Local
sudo mkdir -p /opt/nginx/html/
sudo aws s3 cp s3://${s3_bucket}/index.html /opt/nginx/html/

##Start Nginx docker container along with pushing logs to Cloud watch
docker run -d --name web_server --log-driver=awslogs \
--log-opt awslogs-region=${aws_region} \
--log-opt awslogs-group=NginxDockerLogs \
--log-opt awslogs-create-group=true -v /opt/nginx/html/:/usr/share/nginx/html/ -p 80:80 nginx