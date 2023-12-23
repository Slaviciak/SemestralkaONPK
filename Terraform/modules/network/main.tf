terraform {
  required_providers {
    openstack = {
      source = "terraform-provider-openstack/openstack"
    }
  }
}

resource "openstack_networking_network_v2" "network_public" {
  name           = "network_public"
  admin_state_up = "true"
}

resource "openstack_networking_network_v2" "network_private" {
  name           = "network_private"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet_public" {
  name       = "subnet_public"
  network_id = openstack_networking_network_v2.network_public.id
  cidr       = "192.168.4.0/24"
  ip_version = 4
}

resource "openstack_networking_subnet_v2" "subnet_private" {
  name       = "subnet_private"
  network_id = openstack_networking_network_v2.network_private.id
  cidr       = "192.168.10.0/24"
  ip_version = 4
}

resource "openstack_networking_router_v2" "router_1" {
  name                = "router_1"
  admin_state_up      = true
  external_network_id = "3b3d6331-6050-497b-826f-4144382160bd"
}

resource "openstack_networking_router_interface_v2" "router_interface_1" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_public.id
}

resource "openstack_networking_router_interface_v2" "router_interface_2" {
  router_id = openstack_networking_router_v2.router_1.id
  subnet_id = openstack_networking_subnet_v2.subnet_private.id
}

resource "openstack_networking_port_v2" "port_jump_private" {
  name           = "port_jump_private"
  network_id     = openstack_networking_network_v2.network_public.id
  admin_state_up = "true"
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.subnet_public.id
  }
}

resource "openstack_networking_port_v2" "port_target_private" {
  name           = "port_target_private"
  network_id     = openstack_networking_network_v2.network_private.id
  admin_state_up = "true"
  fixed_ip {
    subnet_id = openstack_networking_subnet_v2.subnet_private.id
  }
}

resource "openstack_networking_floatingip_v2" "jump_floatingip" {
  pool = "ext-net-154"
}
