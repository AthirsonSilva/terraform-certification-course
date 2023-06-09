output "instance_ip_public_address" {
  value       = aws_instance.app.public_ip
  description = "value of the instance ip address"
}

output "instance_ip_public_dns" {
  value       = aws_instance.app.public_dns
  description = "value of the instance ip address"
}

output "vpc_module_azs" {
  value = module.vpc.azs
}

output "vpc_module_private_subnets" {
  value = module.vpc.private_subnets
}