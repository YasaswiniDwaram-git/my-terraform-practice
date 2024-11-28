variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
}

variable "common_tags" {
    type = map
    default = {
        project = "myproject1"
        terraform = "true"

    }
}

variable "tags" {
  type = map
}

variable "instance_names" {
    type = map
}

variable "environment" {
    type = string
}

variable "domain_name" {
    type = string
    default = "yashd.icu"
}

variable "zone_id" {
    default = "Z00909132T1JJDSG4SBDV"
}