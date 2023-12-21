resource "openstack_networking_network_v2" "network_1" {
  name           = "tf_test_network"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  network_id = openstack_networking_network_v2.network_1.id
  cidr       = "10.0.0.0/24"
  ip_version = 4
}


resource "openstack_networking_router_v2" "router" {
name = "myRouter"
admin_state_up = true
}

resource "openstack_networking_port_v2" "port" {
name           = "port_1"
network_id     = openstack_networking_network_v2.network_1.id
admin_state_up = "true"  
}

resource "openstack_networking_router_interface_v2" "if1" {
  router_id = openstack_networking_router_v2.router_1.id

}