
output "jump_fip_association" {
  value = openstack_compute_floatingip_associate_v2.jump_fip_association
}

output "jump_private_IP" {
  value = openstack_compute_instance_v2.instance_jump.access_ip_v4
}

output "target_instance_IP" {
  value = openstack_compute_instance_v2.instance_target.access_ip_v4
}
