## Create a VPC called 'Polkadot Public VPC' with subnet range 10.0.0.0/16.
## Update: No need to setup the EC2 instances in public VPC subnets after clarification from Eric Collazo
# resource "aws_vpc" "Polkadot_Public_VPC" {
#   cidr_block = "10.0.0.0/16"
# }



# Initialize the 1st EC2 instance of type = "c6i.4xlarge" & AMI = "ami-0faab6bdbac9486fb" as noted in the 
# docs:https://wiki.polkadot.network/docs/maintain-guides-how-to-validate-polkadot 
# Will replace with t2 micro (free tier) after clarification from Eric Collazo
resource "aws_instance" "EC2_primary" {
  ami           = "ami-09024b009ae9e7adf"
  instance_type = "t2.micro"
  associate_public_ip_address = true  # Assign a public IP
  vpc_security_group_ids = [aws_security_group.polkdot_EC2_sg.id]

  tags = {
    Name = "Primary Polkadot instance"
  }
}

# Initialize the 1st EC2 instance of type = "c6i.4xlarge" & AMI = "ami-0faab6bdbac9486fb" as noted in the 
# docs:https://wiki.polkadot.network/docs/maintain-guides-how-to-validate-polkadot 
# Will replace with t2 micro (free tier) after clarification from Eric Collazo
resource "aws_instance" "EC2_secondary" {
  ami           = "ami-09024b009ae9e7adf"
  instance_type = "t2.micro"
  associate_public_ip_address = true  # Assign a public IP
  vpc_security_group_ids = [aws_security_group.polkdot_EC2_sg.id]

  tags = {
    Name = "Secondary Polkadot instance"
  }
}

####### Create security group to allow all inbound IPs (not recommended but for the sake of the assessment) #########

resource "aws_security_group" "polkdot_EC2_sg" {
  name        = "polkdot_EC2_sg"
  description = "Allow all inbound traffic"
  
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all inbound communication
    cidr_blocks = ["0.0.0.0/0"]
  }
}