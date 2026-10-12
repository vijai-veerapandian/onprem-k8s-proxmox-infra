
# onprem-k8s-proxmox-infra

Terraform to provision the on-prem kubernetes cluster VMs on Proxmox, using the bpg/proxmox provider. Reusuable modules + pre-environment root modules.

## Cluster (environments/homelab)
|VM   |      Role     |   host |vCPU| RAM | Disk  |       IP       |
|-----|---------------|--------|--- |-----|-------|----------------|
| cp1 | control-plane | pve-01 | 4  | 4GB | 32 GB | 192.168.10.101 |
| cp2 | control-plane | pve-02 | 4  | 4GB | 32 GB | 192.168.10.102 |
| cp3 | control-plane | pve-03 | 4  | 4GB | 32 GB | 192.168.10.103 |
| dp1 | worker        | pve-02 | 4  | 8GB | 40 GB | 192.168.10.111 |
| dp2 | worker        | pve-03 | 4  | 8GB | 40 GB | 192.168.10.112 |

Control-plance VIP (kube-vip, set later in the k8s bootstrap): 192.168.10.100.

## Usage
```
cd environments/homelab
cp teraform.tvars.example teraform.tfvars # fill in token + ssh key
terraform init && terraform plan && terraform apply
terraform output
```

