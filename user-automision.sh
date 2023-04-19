#!/bin/bash
USER=$1
EXISTING_USER=$(cat /etc/passwd | grep -iw $USER | cut -d ":" -f1)
if [ "${EXISTING_USER}" = "$USER" ]; then
    echo "The Selected User $USER already exist. please use a different name"
else
    echo "Lets Ceate User $USER"
            sudo useradd -m $USER --shell /bin/bash
            sudo mkdir -p /home/$USER/.ssh
            sudo chown -R $USER /home/$USER/
            sudo touch /home/$USER/.ssh/authorized_keys
            sudo usermod -aG sudo $USER
            echo '$USER ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers
fi
