# DevOps-Task

## Description
> Provisioning Infrastructure as a code with terraform for Web Applications and Databases
(MongoDB, SQL Server) and Redis for caching, with Domain Name, Certificate, and Load
Balancer, Using docker and Kubernetes.

## Tools
  - AWS
  - Terragorm
  - Docker
  - Kubernetes
  - Scripting

## Run Project 
- Clone the project
```bash  
   git clone https://github.com/salmarefaie/DevOps-Task.git
```

## Infrastructure
- Required infrastructure to make EKS Cluster is vpc with 4 subnets; 2 public subnets and 2 private subnets, internet gateway, nat and bastion host in public subnets and worker node in private 
  subnets. we will connect with EKS cluster using Ec2 bastion host.
  
  ![infra-diagram](https://github.com/salmarefaie/DevOps-Task/assets/76884936/a9b934a0-d291-4184-9e33-7bc45c93e91f)


- To Run Infrastructure using Terraform
  ```bash      
   cd Terraform
   terraform init
   terraform fmt
   terraform plan
   terraform apply
  ```
## Aspnet App
- Downlooad aspnet application from this repo
```bash  
   https://github.com/docker/awesome-compose/tree/master/aspnet-mssql
```
- Build Docker file for aspnet application to create image then push it to Docker Hup
```bash  
   cd aspnetapp
   docker build -t aspnet-app .
   docker tag aspnet-app salmarefaie29/aspnet-app
   docker push salmarefaie29/aspnet-app:latest
```
   ![Docker-image](https://github.com/salmarefaie/DevOps-Task/assets/76884936/014d6cd0-5c59-4d5c-a901-dfad21ffdc47)
   
   ![Docker-image2](https://github.com/salmarefaie/DevOps-Task/assets/76884936/e1afb655-47bc-4c2c-a552-179744af2ef7)

## Install AWS CLI and kubectl 
- we need to install aws cli and kubectl on ec2 bastion host to connect with EKS cluster using bastion host machine.
- we will connect with bastion host machine using ssh and transfare key to bastion host machine to connect with node worker through bastion host.

 ```bash      
    chmod 400 task.pem
    scp -i task.pem task.pem ubuntu@3.86.85.134:/home/ubuntu
    ssh -i "task.pem" ubuntu@3.86.85.134
  ```
  
- install kubectl and aws cli using scripting

 ```bash      
    scp -i task.pem install-packages.sh ubuntu@3.86.85.134:/home/ubuntu
    sh install-packages.sh
 ```
 
 ## Enable Docker 
 - we can enable docker manually on node worker and we connect to node worker through bastion host.
 
 ```bash      
    ssh -i "task.pem" ec2-user@10.0.3.18
    sudo systemctl start docker
    sudo systemctl status docker
 ```
