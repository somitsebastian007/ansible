# Login to Ansible Control Server
ssh -i key.pem ubuntu@<public-ip>

# For Ubuntu/Debian: (Master)
sudo apt update -y
sudo apt install software-properties-common
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# Verify Installation: (Master)
ansible --version

# Edit Inventory File: (Master)
touch inventory.yml

# Set Up SSH Access to Managed Nodes (Master)
ssh-keygen -t rsa -b 2048

# Now copy the content of /home/ubuntu/.ssh/id_rsa.pub to clipboard (Master)
cat /home/ubuntu/.ssh/id_rsa.pub

# Now login to Manage Node
ssh -i <key.pem> ubuntu@<second-ip-public>
# Create a new file id_rsa.pub and paste the content (Manage Node)
vi id_rsa.pub

# Run Below Commands (Manage Node)
mkdir -p ~/.ssh
cat ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
cat id_rsa.pub >> ~/.ssh/authorized_keys
cat ~/.ssh/authorized_keys

# Test ssh connectivity to Managed Node after copying the key: (Master)
ssh user@192.168.1.10  # use private IP

# Ping from Ansible
ansible -i "172.31.29.175" all -m ping -u ubuntu -k
ansible all -m ping
ansible test -m ping

# Update ansible default invenstory
sudo vi /etc/ansible/hosts