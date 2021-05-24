## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt-text](https://github.com/Juan-byte-megabyte/Rice-CS-Boot/blob/b30a5f320ea4391d163a0a4fa31f5c5f475363ef/Diagrams/Azure%20Network%20Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the YML file may be used to install only certain pieces of it, such as Filebeat.

[Playbook.yml](https://github.com/Juan-byte-megabyte/Rice-CS-Boot/blob/17982617cc1420008dd4c0606ac58d5850b1f925/Ansible/my%20firstplaybook.yml) - This was used to install DVWA servers.
[ELKPlaybook.yml](https://github.com/Juan-byte-megabyte/Rice-CS-Boot/blob/20f797142e8605fbe55ef66cf221e0617f2edbb9/Ansible/Install%20ELK.yml) - This was used to install ELK server.
[filebeat-playbook.yml](https://github.com/Juan-byte-megabyte/Rice-CS-Boot/blob/20f797142e8605fbe55ef66cf221e0617f2edbb9/Ansible/install%20filebeat.yml) - This was used to install/configure Filebeat on DVWA & ELK server.
[metricbeat-playbook.yml](https://github.com/Juan-byte-megabyte/Rice-CS-Boot/blob/20f797142e8605fbe55ef66cf221e0617f2edbb9/Ansible/install%20metricbeat.yml) - This was used to install/configure Metricbeat on DVWA & ELK server.
  
This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the Damn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
- Load balancers help ensure environment availability through distribution of incoming data to web servers. Jump boxes allow for more easy administration of multiple systems and provide an additional layer between the outside and internal assets.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the event logs and system metrics.
- Filebeat watches for log files/locations and collect log events. (Filebeat: Lightweight Log Analysis & Elasticsearch)
- Metricbeat records metrics and statistical data from the operating system and from services running on the server (Metricbeat: Lightweight Shipper for Metrics)

The configuration details of each machine may be found below.

|    Name    |          Function         | IP Address |   Operating System       |
|:----------:|:-------------------------:|:----------:|:--------------------:    |
| Jump Box   | Gateway                   | 10.0.0.4   | Linux (Ubuntu 18.04 LTS) |
| Web-3      | WebServer - Docker - DVWA | 10.0.0.8   | Linux (Ubuntu 18.04 LTS) |
| Web-4      | WebServer - Docker - DVWA | 10.0.0.9   | Linux (Ubuntu 18.04 LTS) |
| ELK Server | ELK Stack                 | 10.1.0.4   | Linux (Ubuntu 18.04 LTS) |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JUMPBOX machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Through my personal IP address from my computer.
- Machines within the network can only be accessed by SSH.
- The only machines that can access the ELK server are my personal computer through my public IP address, 
  and the Jump Box VM at 10.0.0.4 through a peering connection.

A summary of the access policies in place can be found in the table below.

|    Name   |  Public Accesible |      Allowed IP Address     |
|:---------:|:-----------------:|:---------------------------:|
| Jump Box  | No                |     Personal IP Address     |
| Web-3     | Yes-Load Balancer |        104.45.144.39        |
| Web-4     | Yes-Load Balancer |        104.45.144.39        |
| ELK Stack | No                | Personal IP Address via SSH |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because ansible can be run
from the command line and will ensure our provisioning scripts run correctly. Also this helps eliminate configuration errors and limits multiple mistakes.

The playbook implements the following tasks:
*Installs Docker
*Installs Python-pip
*Install Docker python module
*Increases virtual memory
*Downloads and launches a docker ELK container with the following published ports: 5601 9200 5044


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![alt-text](https://github.com/Juan-byte-megabyte/Rice-CS-Boot/blob/20f797142e8605fbe55ef66cf221e0617f2edbb9/Diagrams/Elk%20sudo%20docker%20ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
..*	Web-3 (10.0.0.8)
..*	Web-4 (10.0.0.9)

We have installed the following Beats on these machines:
..* Filebeat
..* Metricbeat

These Beats allow us to collect the following information from each machine:
_ Filebeat helps generate and organize log files to send to Logstash and Elasticsearch. Specifically, it logs information about the file system, including which files have changed and when.

_ Metricbeat collects metrics from systems and services to send to Elasticsearch on the ELK Server. The logs contain information such as CPU usage, memory, disk I/O, and network I/O statistics.


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-config.yml and metricbeat-config.yml file to /etc/ansible/files.
- Update the configuration file to include the private IP address of the ELK-Server to the ElasticSearch and Kibana Sections of the configuration file.
- Run the playbook, and navigate to ELK-Server-PublicIP:5601/app/kibana to check that the installation worked as expected.

- Which file is the playbook? 
 _elk-playbook.yml - used to install ELK Server
- Where do you copy it?_
 _/etc/ansible 
- Which file do you update to make Ansible run the playbook on a specific machine?
-_/etc/ansible/hosts.cfg
- How do I specify which machine to install the ELK server on versus which to install Filebeat on?
-_In /etc/ansible/hosts you tell it where you want each to be installed ElkServers or FileBeat.
- Which URL do you navigate to in order to check that the ELK server is running?
 _http://publicip(elkserver):5601
 

Commands needed to run the Anisble Configuration for the Elk-Server are:

ssh RedAdmin@JumpBox(Public IP Address)

sudo docker container list -a

sudo docker start compassionate_bhaskara

sudo docker attach compassionate_bhaskara

Add DVWA’s & ELK to hosts file:
*cd /etc/ansible
*nano /etc/ansible/hosts
*add private IP’s for [webservers]
*add private IP for [elk]

Run playbook to update elk:
*ansible-playbook elk-playbook.yml (Installs and Configures ELK-Server)

Run playbook to update the filebeat:
ansible-playbook filebeat-playbook.yml (Installs and Configures Beats)

Run playbook to install metricbeat:
ansible-playbook metricbeat-playbook.yml (installs and configures metricbeat)

Open a new browser on Personal Workstation, navigate to (ELK-Server-PublicIP:5601/app/kibana) - This will bring up Kibana Web Portal

