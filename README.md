## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below. root@71363e809b5:/etc/ansible
                
Project 1 Diagram
 

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the .yml files may be used to install only certain pieces of it, such as Filebeat.

  - hosts
    install-elk.yml
    filebeat.yml
    filebeat-config.yml
    metricbeats-playbook.yml
    metric-config.yml
    full-elk.yml
    

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- What aspect of security do load balancers protect? Availability
What is the advantage of a jump box? It allows control of remote machines on the web. The real advantage is you can setup just 1 machine to have access to those resources so that someone has to penetrate that machine in order to alter the other machines on the network. This machine does not need to run all the time. This provides a technical "air gap" between an attacker and your network resources. You can't access what isn't active.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system resources.
- Filebeats views systemlogs
- Metricbeats view metrics of the system

The configuration details of each machine may be found below.

| Name     | Function  | IP Address | Operating System |
|----------|-----------|------------|------------------|
| Jump Box | Gateway   | 10.0.0.4   | Linux            |
| Web-1    | WebServer | 10.0.0.5   | Linux            |
| Web-2    | Webserver | 10.0.0.6   | Linux            |
| Elkhunt  |Siem Server| 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jump box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 71.199.26.64

Machines within the network can only be accessed by wizardly_grothendieck.
- My home PC can access the ELK server as well as the Jump Box Provisioner. Their IPs are 71.199.26.64 and 10.0.0.4 respectively

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | No                  | 71.199.26.64         |
|          |                     |                      |
|          |                     |                      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- Ease of administration and uniformity of deployed software and settings.

The playbook implements the following tasks:
- It deploys Docker
- It deploys DVWA
- It deploys and ELK Stack
- Deploys filebeats
- Deploys Metricbeats

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

 

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
10.0.0.5
10.0.0.6

We have installed the following Beats on these machines:
- File Beats and Docker Beats

These Beats allow us to collect the following information from each machine:
- File Beats collects system logs. This consists of all activity on the servers. (Logons, software upgrades, server initiation, etc.) Metric Beats gives us all the vital hardware metrics on a machine from how many CPUs or how much ram is being used to how current network traffic on the unit. THis allows us to establish a baseline so we can tell in the future if we have anamolous activity on the unit we're monitoring.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-config.yml file to /etc/ansible/files.
- Copy the metric-config.yml file to /etc/ansible/files.
- Update the hosts file to include the "group" 
- Run the playbook, and navigate to http://104.42.76.165:5601/app/kibana -> add log data -> system logs -> check data (at the bottom of the page) to check that the installation worked as expected for filebeat.
- Run the playbook, and navigate to http://104.42.76.165:5601/app/kibana -> add metric data -> docker metrics -> check data (at the bottom of the page) to check that the installation worked as expected for metricbeat.


_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._

The following screenshots shot shows an example of the elk install playbook should it need to be recreated.

 

Should you need to completely recreate the elk stack installation playbook it is best to run:
curl https://utah.bootcampcontent.com/utah-coding-bootcamp/UofU-VIRT-CYBER-PT-10-2021-U-LOL/-/blob/main/13-Elk-Stack-Project/Activities/Stu_Day_1/Resources/install-elk.yml > /etc/ansible/roles/install-elk.yml
This will output a template for the elk installation process and simply use nano to make the alterations you see in the screenshot above to it.


The following screenshots shot shows an example of the filebeats playbook should it need to be recreated.

 

Should you need to completely recreate the filebeat installation playbook it is best to run:
curl https://utah.bootcampcontent.com/utah-coding-bootcamp/UofU-VIRT-CYBER-PT-10-2021-U-LOL/-/blob/main/13-Elk-Stack-Project/Activities/Stu_Day_2/Unsolved/Resources/filebeat-playbook.yml > /etc/ansible/roles/filebeat-playbook.yml

Alter this file with nano to fill in the blanks. (please note the curl command to download the filebeat deb file should be found on your kibana site after the initial installation of the elk stack. add logs files -> system logs -> deb

The following screenshot shows an example of the metricbeat playbook should it need to be recreated with out current setup.

 


Should you need to completely recreate the filebeat installation playbook it is best to run:
curl https://utah.bootcampcontent.com/utah-coding-bootcamp/UofU-VIRT-CYBER-PT-10-2021-U-LOL/-/blob/main/13-Elk-Stack-Project/Activities/Stu_Day_2/Unsolved/Resources/metricbeat-playbook.yml > /etc/ansible/roles/metricbeats-playbook.yml

Alter this file with nano to fill in the blanks. (please note the curl command to download the metricbeat deb file should be found on your kibana site after the initial installation of the elk stack. add metric data -> docker metrics -> deb

Other files will need to be gahtered and/or updated as well.
goto /etc/ansible, there you will find the hosts file. Create two groups webservers and elk
[webservers]
10.0.0.5 ansible_python_interpreter=/usr/bin/python3
10.0.0.6 ansible_python_interpreter=/usr/bin/python3
[elk]
10.1.0.4 ansible_python_interpreter=/usr/bin/python3

Once this has been accomplished create two subdirectories within your ansible directory (etc/ansible) One called "files" the called "roles" Place any playbook files listed above into the roles directory and configuration files into the roles directory.

You will need to gather two configuration files one for filebeat the other for metricbeat. 
First use the following command to download an example filebeat configuration file:
curl https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/filebeat-config.yml

as mentioned above copy this file into your /etc/ansible/files directory with the following command:

mv filebeat-config.yml /etc/ansible/files/filebeat-config.yml

once there run the following command:

nano /etc/ansible/files/filebeat-config.yml

this will allow you to alter the filebeat-config.yml. Goto line 1106 and replace the place holder IP with 10.1.0.4:9200
then goto line 1806 and replace the place holder IP there with 10.1.0.4:5601 and save the file.

The process is similar with metricbeat. 
To gather it's config file run:
curl https://gist.githubusercontent.com/slape/58541585cc1886d2e26cd8be557ce04c/raw/0ce2c7e744c54513616966affb5e9d96f5e12f73/metricbeat > /etc/ansible/metric-config.yml

move this file to the files directory

mv metric-config.yml /etc/ansible/files/metric-config.yml

nano /etc/ansible/files/metric-config.yml

once here alter the IP on line 62 and 95 to be 10.1.0.5:5601 save the file.

By now you should be ready to install the ELK stack begin by installing the ELK stack using the command

ansible-playbook /etc/ansible/roles/install-elk.yml
(please note the directory structure is unecessary if you are in the directory the yml file is in.)

Now install filebeat:
ansible-playbook /etc/ansible/roles/filebeat-playbook.yml

Now install metricbeat:
ansible-playbook /etc/ansible/roles/metricbeats-playbook.yml

Congratulations you have now recreated the elk stack!
