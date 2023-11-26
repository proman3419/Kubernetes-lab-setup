resource "openstack_compute_flavor_v2" "h2d-slarge" {
  name  = "h2d.slarge"
  ram   = "28000"
  vcpus = "8"
  disk  = "100"
  count = var.create_flavor_h2dslarge ? 1 : 0
}

resource "openstack_compute_flavor_v2" "h2-medium" {
  name  = "h2.medium"
  ram   = "14000"
  vcpus = "4"
  disk  = "30"
  count = var.create_flavor_h2medium ? 1 : 0
}
