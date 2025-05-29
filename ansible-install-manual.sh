# Login to Ansible Control Server
ssh -i key.pem ubuntu@<public-ip>

# For Ubuntu/Debian: (Master)
sudo apt update -y # Updates the local package index from the configured repositories
sudo apt install software-properties-common # mandatory to install software from 3rd party sources, like the Ansible PPA.
sudo add-apt-repository --yes --update ppa:ansible/ansible # Adds ansible repository
sudo apt install ansible -y # Install Ansible

# Verify Installation: (Master)
ansible --version

# Edit Inventory File: (Master) (Optional can use default inventory)
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
mkdir -p ~/.ssh # Optional, Run only if required
cat ~/.ssh/authorized_keys # Optional, Run only if required
chmod 600 ~/.ssh/authorized_keys # Optional, Run only if required
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


How key based SSH Works (Behind the Scenes):
------------------------------------------
=> When Ansible runs a playbook or module, it uses ssh to connect.
=> SSH client uses the private key to generate a cryptographic signature.
=> The remote SSH server (on the managed node) checks if the public key exists in authorized_keys.
=> If it does, it uses a challenge-response mechanism to verify the private key matches the public key.
=> If verified, access is granted — no password needed.