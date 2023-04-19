#!/bin/bash
USER=$1
if [ $# -gt 0 ]; then
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
        echo "Generating Random Password..."
        SPEC=$(echo '!@#$%^&*()_' | fold -w1 | shuf | tail -1)
        PASS="Harish@${RANDOM}${SPEC}"
        echo "$USER:$PASS" | chpasswd
        echo "Login Username Is $USER Password is $PASS"
        passwd -e $USER
    fi
else
    echo "You Have Given $# Arguments. Please Provide Valid Input."
fi
