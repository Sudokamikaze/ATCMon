Asterisk trunks & peers monitoring by Zabbix agent & Ansible deployment 
==========

Table of contents
-----------------
* [Installation](#installation)
    * [Ansible](#ansible)
       * [Automated](#automated)
       * [Manual](#manual)

Installation
=====

First of all, you must declare your peers in `asterisk_peers_list.txt` as following example: 

1. Run command in ssh prompt: `asterisk -rx 'sip show peers'
2. Get output something like this:
```
GSM/GSM 192.168.0.151                            D  Yes        Yes            5060     OK (34 ms)                                  
FXO/FXO 192.168.0.3                              D  Yes        Yes            58602    OK (25 ms)      
```
3. Format `asterisk_peers_list.txt` like that:
```
GSM
FXO
```

And proceed to next step

Ansible
=====

### Automated

Just run `make` in root directory of the project

### Manual 

Run this command and answer some questions before we can start
```
ansible-playbook \
    playbooks/inventory_gen.yml
```

After that, execute main playbook by running this command:
```
ansible-playbook \
    playbooks/deploy.yml
```
