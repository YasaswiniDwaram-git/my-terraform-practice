resource "aws_instance" "foreach" {
ami = var.ami_id
for_each = var.instances
instance_type = each.value
vpc_security_group_ids = [aws_security_group.allow_ssh.id]
tags = {
    Name = each.key
}
}

resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description

    ingress{
        from_port = var.from_port
        to_port = var.to_port
        protocol = var.protocol
        cidr_blocks      = var.cidr_blocks

    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]


    }

    tags = {
        Name = "ALLOW-SSH"
    }
}