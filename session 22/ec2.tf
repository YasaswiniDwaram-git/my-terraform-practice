resource "aws_instance" "session_22" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    tags = {
        Name = "instance-22"
    }
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