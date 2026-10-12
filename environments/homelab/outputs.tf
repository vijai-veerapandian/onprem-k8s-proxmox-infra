output "nodes" {
  description = "Provisioned nodes"
  value = {
    for k, m in module.nodes : k => { vm_id = m.vm_id, ip = m.ip }
  }
}

output "control_plane_ips" {
  value = [for n, s in var.nodes : s.ip if s.role == "control-plane"]
}

output "worker_ips" {
  value = [for n, s in var.nodes : s.ip if s.role == "worker"]
}
