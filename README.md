# DCM configuration

The main objective of this Ansible project is to automate the configuration of the DCM component to be deployed in 5G EVE from scratch, with differents steps to be executed, all gathered in main_playbook.yml.

Be sure of using this Ansible in a server which is able to reach the DCM server through a SSH connection.

**Note: be aware of having Internet connection and DNS resolution in the DCM server to be updated. For that purpose, include *nameserver 8.8.8.8* in */etc/resolv.conf* in case it has not been included in that file or in */etc/network/interfaces* file with the clause *dns-nameservers 8.8.8.8*. Moreover, it is desirable to exchange SSH keys between the DCM server and the server in which Ansible will be executed.**

## How to deploy it?

### 1. Install Ansible
 
```sh
$ sudo apt-get update -y
$ sudo apt-get install software-properties-common -y
$ sudo apt-add-repository --yes --update ppa:ansible/ansible
$ sudo apt-get install ansible -y
$ export ANSIBLE_HOST_KEY_CHECKING=False
```

### 2. Install git (in case you haven't done it before)

```sh
$ sudo apt-get update -y
$ sudo apt-get install git -y
```

### 3. Download this DCM repository from Gitlab

It is contained in the 5geve-wp3-dcm-deployment Ansible project:

```sh
$ cd /tmp
$ git clone git@github.com:5GEVE/5geve-wp3-dcm-deployment.git
$ cd 5geve-wp3-dcm-deployment
$ git checkout dev # if exists - if not, use master branch or whatever
```

### 4. Modify Ansible files

In this Ansible project, there are some configuration files that must be completed with all the necessary information in order to reflect the infrastructure to be uploaded with all the steps included here. The configuration files with their description are the following:

* **hosts:** here, you have to include the DCM server which will be configured within this Ansible project. The format of each line (PLEASE FOLLOW THIS FORMAT) should be the following: *dcm_hostname ansible_host=<DCM_IP> ansible_user=<USER> ansible_ssh_pass=<SSH_PASS> ansible_become_pass=<SUDO_PASS>*
* **group_vars:** includes useful variables for the servers defined in the *hosts* file.
	* **all:** applies to all servers. Nothing to change here at the beginning. Only if you want to be stopped with each Ansible role execution, set *prompt_when_finishes_tasks* to true, or false otherwise. Other variables that may require a change are *kafka_version*, which must be set to the Kafka version to be used, and *update_module*, which specifies if it is an update (true) or an installation from scratch (false).

### 5. Download 5geve-wp3-dcm-handler repository from Gitlab

```sh
$ cd /tmp
$ git clone git@github.com:5GEVE/5geve-wp3-dcm-handler.git
$ cd 5geve-wp3-dcm-handler
$ git checkout dev # if exists - if not, use master branch or whatever
```

### 6. Compress 5geve-wp3-dcm-handler project and put it in this Ansible project as file

The easiest way to transfer the 5geve-wp3-dcm-handler project to the DCM server without having to exchange private keys or related (and confidential) information is to compress the 5geve-wp3-dcm-handler project and send it to the DCM server, where it would be decompressed and executed afterwards.

```sh
$ cd /tmp
$ mv 5geve-wp3-dcm-handler dcm-python
$ tar czf dcm-python.tar.gz dcm-python
$ mkdir 5geve-wp3-dcm-deployment/roles/preparation/files # if not exist
$ mv dcm-python.tar.gz 5geve-wp3-dcm-deployment/roles/preparation/files
```

### 7. Run Ansible

```sh
$ cd /tmp/5geve-wp3-dcm-deployment
$ ansible-playbook -i hosts main_playbook.yml
```

### 8. Other considerations

* In case you want to monitor how much time is spent in each task, you have to modify the file */etc/ansible/ansible.cfg* by uncommenting the callback_whitelist variable (line 83 of the file, "probably"), putting the following value: *callback_whitelist = profile_tasks*

## Copyright

This work has been done by Telcaria Ideas S.L. for the 5G EVE European project under the [Apache 2.0 License](LICENSE).
