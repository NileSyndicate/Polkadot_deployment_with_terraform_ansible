# Polkadot_deployment_with_terraform_ansible

This project aims towards provisioning AWS EC2 instances using Terraform. Next, The polkadot node binaries as well as the related systemd unit file will be deployed on them using Ansible.

## Using Terraform to deploy 2 EC2 instances with public IPs:
1. Navigate to /Terraform
2. Run "Terraform init"
3. Run "Terraform plan". terraform.tfstate should be created in the same directory.
4. Run "Terraform apply". 

Note: AWS credentials have to be setup first.

The Public IPs of the EC2 instances will be printed out on console. Copy & paste them to "/Ansible/inventory.ini" under [polkadot-nodes]

## Using Ansible to automate the installation of the Polkadot binaries:
1. Navigate to /Ansible
2. Using an editor, open "deploy_polkadot.yml". Comment out ONLY ONE of the sections either starting with "1st installation method:" OR "2nd installation method:". Save and exit.
3. Run "ansible-playbook -i inventory.ini deploy_polkadot.yml"

## Using Ansible to create a systemd process:
1. Navigate to /Ansible
2. Open "polkadot_sysd_process.yml"
3. Edit the value of the parameter "polkadot_bin_path:" to the path of the Polkadot bin location used during installation
4. Run "ansible-playbook -i inventory.ini polkadot_sysd_process.yml"