# Per-VM inputs
variable "name"   { type = string }
variable "target" { type = string } # Proxmox node name to place the VM on 
variable "role"   { type = string } # Control-plane | worker
variable "cores"  { type = number }
variable "memory" { type = number } # MB
variable "disk"   { type = number } # GB
variable "ip"     { type = string } # without CIDR suffix

# Shared inputs ( passed from the environment)
variable "template_vm_id" { type = number }
variable "template_node"  { type = string } # node the template disk lives on 
variable "datastore_id"   { type = string }
variable "network_bridge" { type = string }
variable "gateway"        { type = string }
variable "dns_servers"    { type = list(string) }
variable "ci_user"        { type = string }
variable "ssh_public_key" { type = string }
