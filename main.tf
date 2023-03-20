resource "proxmox_vm_qemu" "proxmox_vm_master" {
  count       = var.num_masters
  name        = "${var.master_names[count.index]}"
  vmid        = "${count.index + var.master_vmid_begin}"
  desc        = var.master_desc
  target_node = var.pm_node_name
  clone       = var.template_vm_name
  onboot      = true
  oncreate    = true
  os_type     = "cloud-init"
  agent       = 1
  memory      = var.num_masters_mem
  cores       = 4
  ci_wait     = 10
  scsihw      = "virtio-scsi-pci"
  disk {
    cache   = "none"
    size = var.master_disk_size
    type = var.master_disk_type
    storage = var.master_disk_location
    format  = "raw"
  }
  network {
        bridge    = "vmbr0"
        firewall  = true
        link_down = false
        model     = "virtio"
    }
  # ipconfig0 = "ip=${var.master_ips[count.index]}/${var.networkrange},gw=${var.gateway}"

  lifecycle {
    ignore_changes = [
      ciuser,
      sshkeys,
      network
    ]
  }

}

resource "proxmox_vm_qemu" "proxmox_vm_workers" {
  count       = var.num_nodes
  name        = "${var.node_names[count.index]}"
  vmid        = "${count.index + var.node_vmid_begin}"
  desc        = var.node_desc
  target_node = var.pm_node_name
  clone       = var.template_vm_name
  onboot      = true
  oncreate    = true
  os_type     = "cloud-init"
  agent       = 1
  memory      = var.num_nodes_mem
  cores       = 6
  ci_wait     = 60
  scsihw      = "virtio-scsi-pci"
  disk {
    cache   = "none"
    size = var.node_disk_size
    type = var.node_disk_type
    storage = var.node_disk_location
    format  = "raw"
  }
  network {
        bridge    = "vmbr0"
        firewall  = true
        link_down = false
        model     = "virtio"
    }
  # ipconfig0 = "ip=${var.worker_ips[count.index]}/${var.networkrange},gw=${var.gateway}"

  lifecycle {
    ignore_changes = [
      ciuser,
      sshkeys,
      network
    ]
  }

}
