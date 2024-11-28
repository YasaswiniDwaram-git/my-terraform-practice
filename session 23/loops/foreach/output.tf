output  "aws_public_ip" {
  value       = {for instance_key , instance in aws_instance.foreach : instance_key => instance.public_ip}
  description = "this is the information of newly created ec2 instances"
}

output "for_each_instances"{
    value = aws_instance.foreach
    description = "This is the output from for_each instances"
}
