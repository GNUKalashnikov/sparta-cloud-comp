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
		- npm

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
Availability
- SNS, alarms, cloud watch 
Scalable
- AMI, EC2, 

