#!/bin/bash
ansible-playbook /vagrant/main.yml -i /home/vagrant/host.txt
# ansible-playbook /vagrant/redis.yml -i /home/vagrant/host.txt
# ansible-playbook /vagrant/web.yml -i /home/vagrant/host.txt
# ansible-playbook /vagrant/balancer.yml -i /home/vagrant/host.txt