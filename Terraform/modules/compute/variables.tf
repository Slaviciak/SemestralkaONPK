variable "key_name" {
  type = string
}

variable "sec_group_name" {
  type = string
}

variable "public_instance_name" {
  type = string
}

variable "private_instance_name" {
  type = string
}

variable "public_private_instance_image" {
  type = string
}

variable "public_instance_flavor" {
  type = string
}

variable "private_instance_flavor" {
  type = string
}

variable "port_target_private_id" {}

variable "jump_floatingip" {}

variable "port_jump_private" {}
