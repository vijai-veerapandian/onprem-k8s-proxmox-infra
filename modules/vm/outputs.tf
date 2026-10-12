# outputs.tf

output "vm_id" { value = proxmox_virtual_environment_vm.this.vm_id }
output "name"  { value = var.name }
output "ip"    { value = var.ip }
