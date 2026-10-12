provider "proxmox" {
  endpoint  = var.proxmox_endpoint  # e.g. https://192.168.10.28:8006/
  api_token = var.proxmox_api_token # set in terraform.tfvars (git-ignored)
  insecure  = true                  # self-signed Proxmox cert 

  ssh {
    agent    = true
    username = var.proxmox_ssh_username
  }
}
