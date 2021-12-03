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
## Day 2
- Adjust security in AWS
	- Change port to open 3000
	- Confirm by running npm in the app	
- EC2-Second Instance
	- *Use the provision scripts for the DB else it wont work*
	- allow the port 27017 
	- transfer the code from yesterdays vagrant section
	- Allow ssh port
	- security:eng99_ivan_db
		- **MAKE SURE TO INCLUDE THE APP IP IN THE DB SECURITY SETTINGS**
	- ip changes every start and stop of the instance
	- allow mongodb - from 0000
		- restart mongo
	- back to original EC2 and enable on app
		- export DB_HOST="mongodb://192.168.10.150:27017/posts

## Key notes
Make sure that tje export DB_HOST is pointing to the Database and not to itself 


#### AMI

1. Instance page
2. Select the instance
3. actions -> create image
4. Image name, description and tag as the same formate of eng99_*name*_ami_thing
5. *Launch* and configure it as needed

#### Alarm

1. Instance page
2. select the instance
3. actions -> "Monitor and troubleshoot"
4. Manage Cloudwatch Alarms

1. Edit or create an alarm
2. **Alarm Notification** -> create a name such as eng_*name*_alarm to easily track it in SNS
3. Set the parameters
4. Create
--- 
#### SNS

1. Search *SNS*
2. Go to topics
3. *Publish message*
	1. Fill in the subject, the "Raw Message" being the message sent and ant attributes if necessary

This has essentially est a message that can now be configured to be sent to either email or number

##### Message
1. Subscription
2. chose the topic (the one you made all the way back in the alarm
3. Choose a protocol and create subscription



## Availability and Scalable

#### Availability
What this word means in reference to application design and maintainability is to be able to stay active and online at all times.
Utilising services to counter performance blocks and proactively implementing measures to negate potential downtime.

#### Scalable
Scaleable for web applications specifically infers on the back-end ability for  adaptation, the ability to promptly enlarge or shrink to adequately address user demand via services is scalability.
Availability
- SNS, alarms, cloud watch 
Scalable
- AMI, EC2, 
---
## Day 3
### To implement Scalability and Availability
![[Pasted image 20211203100416.png]]

### Task List
1. Launch template for our auto scaling group
2. auto scaling group
3. ALB - (*Autoscaling Load balancing*)
4. attach to VPC *Virtual Private Cloud* - 3 subnets to 3 different AZs (*Availability Zones*)
5. SG for app
6. All EC2 have nginx installed
7. Region EU + AZs
8. DR Plan

* Hybrid cloud deployment - Utilised by fintech, banks, etc
*  Multi-region deployment - Big organisation
	*  Allows for expansion for future business
*  Multi cloud deployment - FCA: Banks **Must** have multi cloud deployment


### Using Templates
EC2 -> *Create Launch options*
**template name**:
eng99_*Name*_ASG_it

**Version Description**:
eng99_*Name*_ASG_it:v1

✅ - *Provide guidance to help me up a template that I can use with EC2 Auto Scaling*

#### Chose Instance launch options
**Key Pair name** ⚠️: *make sure it's the same one that has been used thus far*

**AMI**: ami-095b735dce49535b5

**Instance type**: t2.micro

**Network Settings** 
VPC

**Security Groups**: Same as your application

➡️**Advanced**
*Scroll down*
-> User Data
*Input all the provisioning tools, using linux commands*


##### Configure group size and scaling policies

###  Auto Scaling

- On the left hand side -> *Auto Scaling Groups*
- Orange button with *Create auto scaling groups*
-
**Auto Scaling group name**:
eng99-*name*-asg
**template name**:
eng99_*Name*_ASG_it

**Version Description**:
eng99_*Name*_ASG_it:v1

#### Choose instance launch options 
* VPC
	* Use the given vpc
- eu-west-1{a-c}
	- Three total from using a,b and c
#### Advanced
*Load Balancing - optional*
➡️ Attach to new load balancer
-> Application Load Balancer
*eng99-name-asg-alb*
➡️ Load balancer scheme
*Internet-facing*
➡️Listeners and routing
- 80
- New target group name
	- eng99-*name*-asg-alb-tb
✅ Enable group metrics collection within CloudWatch

#### Configure group size and scaling policies
* 2
* 2
* 3
for the inputs
##### Scaling
Choose the desired options

# S3 - *Database*
- Global availability
- Put any kind of data 
- S3 Storage classes
	- Cost effective
		- Applies for the S3 Glacier
	- faster response
		- Ordinary class
- Check access
- apply Create Read Update Delete

### Tasks
- AWS CLI
	- Like bash but communicates with the AWS services on the inside of a terminal.
	- Install required dependencies
		- Python >=3 
		- `sudo apt install python3`
		- `sudo apt install python3-pip`
		- AWS CLI
		- Python package: boto3
		- `python -m pip install awscli`
		- `python -m pip install boto3`
		- enter AWS access keys `aws configure`
		- secret keys
		- region
			- eu-west-1
		- output: json
		- check via `aws s3 ls`
		- make bucket `aws s3 mb s3://eng99-name`
		- `aws s3 ls | grep eng99`
- Commands
	- In addition to `ls` it can also process `rm` to remove an object
	- `rb` to remove a buck itself 
		- *Example* : `sudo aws s3 rb s3://eng99-name`
- 
