resource "proxmox_vm_qemu" "proxmox_vm_master" {
  count       = var.num_masters
  name        = "master${count.index + 1}"
  vmid        = "${count.index + var.master_vmid_begin}"
  target_node = var.pm_node_name
  clone       = var.template_vm_name
  full_clone  = true
  startup     = true
  os_type     = "cloud-init"
  bios        = "seabios"
  agent       = 1
  memory      = var.num_masters_mem
  cores       = 4
  cpu         = "host"
  ci_wait     = 2
  disk {
    slot = 0
    size = var.master_disk_size
    type = var.master_disk_type
    storage = var.master_disk_location
    iothread = 1
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
  name        = "worker${count.index + 1}"
  vmid        = "${count.index + var.node_vmid_begin}"
  target_node = var.pm_node_name
  clone       = var.template_vm_name
  full_clone  = true
  startup     = true
  os_type     = "cloud-init"
  bios        = "seabios"
  agent       = 1
  memory      = var.num_nodes_mem
  cores       = 4
  cpu         = "host"
  ci_wait     = 2
  disk {
    slot = 0
    size = var.node_disk_size
    type = var.node_disk_type
    storage = var.node_disk_location
    iothread = 1
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
