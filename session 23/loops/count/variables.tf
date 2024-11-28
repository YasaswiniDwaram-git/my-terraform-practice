variable "instance_type" {
    type = string
    default = "t3.micro"

}

variable "instance_names" {
    type = list(string)
    default = [ "mysql","frontend","backend"]
}

variable "common_tags" {
    type = map
    default = {
        Name = "session_vars"
        enviroment = "prod"
        Project = "expense"
        terraform =  "true"
    }
}

variable "component" {
    type = list(string)
    default =  [ "mysql","frontend","backend"]
}

variable "enviroment" {
    default = "prod"
}

variable "sg_name" {
    type = string
    default = "allow-ssh"
}

variable "sg_description" {
    type = string
    default = "to allow port 22"

}

variable "ami_id"{
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable "from_port" {
    type = number
    default = 22
}
variable "to_port" {
    type = number
    default = 22
}

variable "protocol" {
    type = string
    default = "tcp"
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}