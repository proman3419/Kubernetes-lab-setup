#!/bin/bash

sudo apt -y install nmap
sudo apt -y install ucspi-tcp

sudo cp /home/ubuntu/kubernetes-lab-setup/configs/push_token_args_listener.service /etc/systemd/system/push_token_args_listener.service
sudo chmod +x /home/ubuntu/kubernetes-lab-setup/scripts/kube_setup/push_token_args_listener.sh
sudo chmod +x /home/ubuntu/kubernetes-lab-setup/scripts/kube_setup/push_token_args.sh
systemctl enable push_token_args_listener.service
