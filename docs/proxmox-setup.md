# Proxmox pre-requisites

## 1. API token for Terraform
Run on any Proxmox node:
```
pveum user add terraform@pve
pveum aclmod / -user terraform@pve -role Administrator
pveum user token add terraform@pve tf-token --privsep 0
```

Put the printed value into `environments/homelab/terraform.tfvars` as `proxmox_api_token`.

## 2. Cloud-init template (one, on pve-01)
Run `scripts/create-ubuntu-template.sh` on **pve-01**. It creates template VMID 9000.
In a Proxmox cluster, VM IDs are unique cluster-wide, so you create it only once.
Terraform clones it to VMs on pve-02/pve03 via a cross-node full clone - that's why `template_node = "pve-01"` is set.

## Storage note
The template disk sits on `local-lvm` (per-host). Cloning to a VM on another node
copies the disk over the network (full clone) - slower but works on Proxmox 8. With shared
storage (Ceph/NFS), clones to any node are fast and local.

