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
   terraform plan
   terraform fmt
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


7. Connect to vm by ssh

![Screenshot from 2023-02-09 17-17-22](https://user-images.githubusercontent.com/76884936/217854385-52516481-9cd0-458d-bb9e-a7d0abc6b5df.png)

8. Connect to cluster from vm and install kubectl and auth plugins 
```bash  
   sudo apt-get install kubectl
   sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin
   gcloud container clusters get-credentials gke --zone us-central1-a --project mineral-order-375711
```
![Screenshot from 2023-02-09 17-16-02](https://user-images.githubusercontent.com/76884936/217854333-ef6535d8-a25a-486e-9f48-e5224cc2e50d.png)

9. Upload yaml files which exists in deployment folder in repo or you can make files in vm by using vi command
   - redis-deployment.yaml: deployment of redis image
   - clusterIP-service.yaml: service to make communication between redis and python application 
   - config-map.yaml: declares enviroments variables. Env variables can be declared also  in docker file but config map is better. 
   - python-deployment.yaml: deployment of python application image
   - loadBalancer-service.yaml: service to expose application from public
   
10. Apply yaml files 
```bash  
   kubectl apply -f redis-deployment.yaml
   kubectl apply -f clusterIP-service.yaml
   kubectl apply -f config-map.yaml
   kubectl apply -f python-deployment.yaml
   kubectl apply -f loadBalancer-service.yaml
   kubectl get all
```
![Screenshot from 2023-02-09 23-43-31](https://user-images.githubusercontent.com/76884936/217946287-7fbe9cc2-2830-4a7b-8e00-f33b3b9816f1.png)
![Screenshot from 2023-02-09 23-46-02](https://user-images.githubusercontent.com/76884936/217946544-5fc26fae-807e-4243-896b-cbba5a776211.png)

11. expose application to public internet by load balancer ip 

![Screenshot from 2023-02-09 23-42-13](https://user-images.githubusercontent.com/76884936/217946182-41c473f1-76e3-4bf1-9a0d-bc6e5c52b830.png)
