#!/usr/bin/env bash
# one-time:
# run on the proxmox host (pve-01).

set -euo pipefail

TEMPLATE_ID="${TEMPLATE_ID:-9000}"
STORAGE="${STORAGE:-local-lvm}"
BRIDGE="${BRIDGE:-vmbr0}"
IMG_URL="https://cloud-images.ubuntu.com/noble/current/noble-server-clouding-amd64.img"
IMG="/var/lib/vz/template/iso/noble-server-cloudimg-amd64.img"

echo ">> Downloading ubuntu 24.04 cloud image..."
[ -f "$IMG" ] || wget -0 "$IMG" "$IMG_URL"

echo ">> Creating template VM $TEMPLATE_ID..."
qm create "$TEMPLATE_ID" --name ubuntu-2404-cloudinit --memory 2048 --cores 2 \
	--net0 virtio,bridge="$BRIDGE"
qm importdisk "$TEMPLATE_ID" "$IMG" "$STORAGE"
qm set "$TEMPLATE_ID" --scsihw virtio-scsi-single --scsi0 "${STORAGE}:vm-${TEMPLATE_ID}-disk-0"
qm set "$TEMPLATE_ID" --ide2 "${STORAGE}:cloudinit"
qm set "$TEMPLATE_ID" --boot order=scsi0
qm set "$TEMPLATE_ID" --serial0 socket --vga serial0
qm set "$TEMPLATE_ID" --agent enabled=1
qm template "$TEMPLATE_ID"

echo ">> Template $TEMPLATE_ID ready. Use it as template_vm_id in terraform.tfvars."
