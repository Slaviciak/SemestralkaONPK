
module "network" {
  source = "./modules/network"
}

module "compute" {
  source = "./modules/compute"

  key_name          = var.key_name
  port_jump_private     = module.network.port_jump_private
  port_target_private_id = module.network.port_target_private_id
  jump_floatingip           = module.network.jump_floatingip

  sec_group_name = var.sec_group_name


  public_instance_name = var.public_instance_name
  private_instance_name = var.private_instance_name
  public_private_instance_image = var.public_private_instance_image
  public_instance_flavor = var.public_instance_flavor
  private_instance_flavor = var.private_instance_flavor
}
