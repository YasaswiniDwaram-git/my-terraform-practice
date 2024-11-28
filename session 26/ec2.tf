resource "aws_instance" "session_26" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
        Name = "instance-26"
    }
    connection {
        type = "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host = self.public_ip

    
    }
#     provisioner "local-exec" {
#         command = "echo I.P address is ${self.private_ip} > public_ip.txt"
# }
    provisioner "remote-exec" {
            inline = [
			   "sudo dnf install ansible -y",
               "sudo dnf install nginx -y",
               "sudo systemctl start nginx",
			]
}

    # provisioner "remote-exec" {
    #     when = destroy
    #     inline = [
    #         "sudo systemctl stop nginx"
    #     ]
    # }
}


resource "aws_security_group" "allow_ssh" {
    name = "ALLOW-SSH"
    description = " to allow port 22"

    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp" #-1 is for evrything but we can give TCP as well
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
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