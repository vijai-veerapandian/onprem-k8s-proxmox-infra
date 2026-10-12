module "nodes" {
  source   = "../../modules/vm"
  for_each = var.nodes

  # per-VM
  name   = each.key
  role   = each.value.role
  cores  = each.value.cores
  memory = each.value.memory
  disk   = each.value.disk
  ip     = each.value.ip
  target = each.value.target

  # shared
  template_vm_id = var.template_vm_id
  template_node  = var.template_node
  datastore_id   = var.datastore_id
  network_bridge = var.network_bridge
  gateway        = var.gateway
  dns_servers    = var.dns_servers
  ci_user        = var.ci_user
  ssh_public_key = var.ssh_public_key
}
