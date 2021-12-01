# Amazon Web Services
---

## EC2
- Create a EC2 instance -VM
- Ubuntu 18.04LTS
- Determine the size of VM
- Establish a security group
- SSH into the machine
	- Update and Upgrade
	- Install NGINX
		- Will be available publicly
	- Require a public ip for the EC2 Instance
	- transfer the app via securecp or rsync
	- install dependencies

### Using Rsync
```bash
rsync -avzh -e "ssh -i eng99.pem" ~/Documents/starter-code/app/ ubuntu@ec2-34-245-24-17.eu-west  
-1.compute.amazonaws.com:/home/ubuntu/app
```