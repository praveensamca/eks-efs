variable "region" {
    default = "us-east-1"
    type = string
}

variable "cidr" {
    type = string
}

variable "azs" {
    type=list(string)
}

variable "public_availability_zone" {
    type = list(string)
}

variable "private_availability_zone" {
    type=list(string)
}

variable "cluster_name" {
    type = string
}

variable "desired_size" {
    type = number
}

variable "max_size" {
    type = number
}

variable "min_size" {
    type = number
}

variable "instance_types" {
    type = list(string)
}

variable "capacity_type" {
    type = string
}

variable "vpc" {
    type = string
}

variable "efs_csi_addon_version" {
    type =  string
}