output "public_ips" {
  value = [
    aws_instance.EC2_primary.public_ip,
    aws_instance.EC2_secondary.public_ip,
  ]
}