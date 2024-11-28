locals {
    instance_type = var.instance_names == "mysql" ? "t2.micro" : "t3.micro"
}