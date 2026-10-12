# -- proxmox connection --

variable "proxmox_endpoint" {
  type = string
}

variable "proxmox_api_token" {
  type      = string
  sensitive = true
}

variable "proxmox_ssh_username" {
  type    = string
  default = "root"
}

# -- shared Vm settins --

variable "template_vm_id" {
  type = number
}

variable "template_node" {
  type    = string
  default = "pve-01"
}

variable "datastore_id" {
  type    = string
  default = "local-lvm"
}

variable "network_bridge" {
  type    = string
  default = "vmbr0"
}

variable "gateway" {
  type    = string
  default = "192.168.10.1"
}

variable "dns_servers" {
  type    = list(string)
  default = ["192.169.10.1", "1.1.1.1"]
}

variable "ci_user" {
  type    = string
  default = "vijai"
}

variable "ssh_public_key" {
  type = string
}

# --  the cluster, described as data --

variable "nodes" {
  description = "Map of VMs to create: name => spec"
  type = map(object({
    role   = string
    cores  = number
    memory = number
    disk   = number
    ip     = string
    target = string
  }))
  default = {
    "cp1" = { role = "control-plane", cores = 4, memory = 4096, disk = 32, ip = "192.168.10.101", target = "pve-01" }
    "cp2" = { role = "control-plane", cores = 4, memory = 4096, disk = 32, ip = "192.168.10.102", target = "pve-02" }
    "cp3" = { role = "control-plane", cores = 4, memory = 4096, disk = 32, ip = "192.168.10.103", target = "pve-03" }
    "dp1" = { role = "worker", cores = 4, memory = 8192, disk = 40, ip = "192.168.10.111", target = "pve-02" }
    "dp2" = { role = "worker", cores = 4, memory = 8192, disk = 40, ip = "192.168.10.112", target = "pve-03" }
  }
}
