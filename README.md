# epam_final_project
# epam_final_project
final project
after creation the ec2 instance from terraform 
connect the ec2 instance and
configure the ec2 instance 

Configuration Management
-----------------------------------
This is process of configuring remote servers from one point of control.
Advantages
----------------------
1) Provisioning of servers
	The applications that should be installed on server can be done very quickly from a single centralized location.

2) Idempotent 
	Configuration management tools are used to bring the server to a particular state, called as desired state. If a server already in the desired state, configuration management tools will not reconfigure that server.
Note: Cofiguration management tools cannot be used for installing OS from the scratch.
They can be used only for managing the applications on top of the OS.
COnfigutaion management tools -  Ansible, chef, puppet, salt  etc
++++++++++++++++++++++++++++++++++++++++++
Ansible  -- It is a open source configuration management tool, created using Python.
Main machine in which anisble is installed, is called as controller.
Remote severs that Ansible configures, are called as managed nodes.

Ansible uses agent less policy for configures remote servers ie Ansible is installed only on 1 machine, and we do not require any client side software to be installed on the remote serers.

Ansible performs configuration management through password less ssh.
++++++++++++++++++++++++++++++++++
Create 4 Servers ( Ubuntu 18 )
1 is server
1 are managed nodes

Name the instances as
server
node

Ubuntu machines default come with Python3

+++++++++++++++++++++++++
Establish password less ssh connection

$ sudo passwd ubuntu
( lets give the password as ubuntu only )

$ sudo vim /etc/ssh/sshd_config

change 
PasswordAuthentication yes
Save and QUIT

$ sudo service ssh restart
$ exit

++++++++++++++++++

Repeat the same steps in node 

++++++++++++++++
Now,  Connect to server
Now , We need to generate ssh connections

$ ssh-keygen

Now copy the key to managed nodes

$ ssh-copy-id ubuntu@   ( private Ip of node)
+++++++++++++++++++++
Installing ansible now

Connect to controller.

$ sudo apt-get install software-properties-common
(  software-properties-common    ,  is a base package which is required to install ansible )

$ sudo apt-add-repository ppa:ansible/ansible

$ sudo apt-get update

$ sudo apt-get install -y ansible

+++++++++++++++++
To check ther version of ansible

$ ansible --version

++++++++++++
Write the ip address of nodes in the inventory file

$ cd /etc/ansible
$ ls

$ sudo vim hosts

insert the private ip addresss of 3 servers
save and quit

$ ls -la     ( to see the list in the current machine )
$ ansible all  -a  'ls  -la'    ( you will get the list of the files in all managed nodes )
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
installing jenkins steps
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Install Jenkins in AWS Instance

To install Jenkins the first thing we need java file so first we need to install java like we have done in the local instance.

We need to download Java 1.8 or more.

1) Update the apt repository
sudo apt update
2) sudo apt install openjdk-8-jdk -y
3) Check the Java Version
java -version
4) Install Maven & Git
sudo apt-get install -y git  maven
5) Check the Verion of Git & Maven
For Git : git --version
For Maven : mvn --version
6) Download & install Jenkins
Open Jenkins website (https://jenkins.io/download/)
Go to Long Term Support
Select Generic Java Package (.war)
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war)
wget  https://get.jenkins.io/war-stable/2.277.2/jenkins.war
11) Start the Jenkins.war file
java -jar jenkins.war
12) Access Jenkins Home Page
Select ec2 instance & Press Connect.
Copy the Domain Name On 4th point.
Paste the Domain name in the browser and in the end enter :8080 with the default port number.
We can access the jenkins with dev server Public IP.
Copy the public ip of the dev server and paste the ip address in the browser and in the end enter :8080 with the default port number.
Public
13) Unclock Jenkins
When we are installing jenkins it will automatically give you the password in the github terminal.
Copy the password and paste the browser.
You will get the password on the step 11
14) Press Install Suggested Plugins
15) Create First admin user
The first user which we create here is the admin user of the jenkins.
Click on save and continue.
Click on save and finish
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Create Sample Job
now start creating the jenkin pipline
