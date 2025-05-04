# For Ubuntu/Debian: (Master)
sudo apt update -y
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# Verify Installation: (Master)
ansible --version

# Edit Inventory File: (Master)
sudo vi /etc/ansible/hosts

# Set Up SSH Access to Managed Nodes (Master)
ssh-keygen

# Test ssh connectivity to Managed Node after copying the key:
ssh user@192.168.1.10





