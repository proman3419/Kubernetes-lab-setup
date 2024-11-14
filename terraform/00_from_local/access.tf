resource "openstack_compute_instance_v2" "access" {
  name = "access"
  image_name = "Ubuntu-Server-22.04-20230914"
  flavor_name = "h1.smedium"
  key_pair = "default"
  security_groups = [
    "default"
  ]

  metadata = {
    label = "access"
  }

  network {
    name = "ii-executor-network"
  }

  user_data = file("../../scripts/gen/target/super_script_access.sh")
}

## get already allocated floating IP
data "openstack_networking_floatingip_v2" "access_ip" {
  address = var.access_ip
}

data "openstack_networking_port_v2" "access_port" {
  fixed_ip = openstack_compute_instance_v2.access.access_ip_v4
}

resource "openstack_networking_floatingip_associate_v2" "access_ip_assoc" {
  floating_ip = var.access_ip
  port_id     = data.openstack_networking_port_v2.access_port.id
}
