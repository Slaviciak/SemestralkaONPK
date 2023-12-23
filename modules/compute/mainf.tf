terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

resource "openstack_compute_floatingip_associate_v2" "jump_fip_association" {
  floating_ip = var.jump_floatingip.address
  instance_id = openstack_compute_instance_v2.instance_jump.id
}

resource "openstack_compute_secgroup_v2" "my_sec_group" {
  name        = var.sec_group_name
  description = "my_sec_group"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "158.193.0.0/16"
  }

  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = "158.193.0.0/16"
  }

  rule {
    from_port   = 443
    to_port     = 443
    ip_protocol = "tcp"
    cidr        = "158.193.0.0/16"
  }

  rule {
    ip_protocol = "icmp"
    from_port   = -1
    to_port     = -1
    cidr        = "158.193.0.0/16"
  }
}

resource "openstack_compute_instance_v2" "instance_jump" {
  name            = var.public_instance_name
  image_name      = var.public_private_instance_image
  flavor_name     = var.public_instance_flavor
  key_pair        = var.key_name
  security_groups = [openstack_compute_secgroup_v2.my_sec_group.id]

  network {
    port = var.port_jump_private.id
  }
}

resource "openstack_compute_instance_v2" "instance_target" {
  name            = var.private_instance_name
  image_name      = var.public_private_instance_image
  flavor_name     = var.private_instance_flavor
  key_pair        = var.key_name
  security_groups = [openstack_compute_secgroup_v2.my_sec_group.id]

  network {
    port = var.port_target_private_id
  }
}
