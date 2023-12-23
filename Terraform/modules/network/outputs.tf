
output "port_target_private_id" {
  value = openstack_networking_port_v2.port_target_private.id
}

output "port_jump_private" {
  value = openstack_networking_port_v2.port_jump_private
}

output "jump_public_IP" {
  value = openstack_networking_floatingip_v2.jump_floatingip.address
}

output "jump_floatingip" {
  value = openstack_networking_floatingip_v2.jump_floatingip
}
