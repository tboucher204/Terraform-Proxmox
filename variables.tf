variable "pm_user" {
  description = "The username for the proxmox user"
  type        = string
  sensitive   = false
  default     = "tboucher204"

}
variable "pm_password" {
  description = "The password for the proxmox user"
  type        = string
  sensitive   = true
  default     = "73345Map!"
}

variable "pm_api_token_id" {
  description = "The api token id for the proxmox user"
  type        = string
  sensitive   = false
  default     = "terraform@pam!tokenid20230320"

}
variable "pm_api_token_secret" {
  description = "The token secret for the proxmox user"
  type        = string
  sensitive   = true
  default     = "95d78883-f5a4-4dc8-971a-4d0e45a33d0f"
}

variable "pm_tls_insecure" {
  description = "Set to true to ignore certificate errors"
  type        = bool
  default     = true
}

variable "pm_host" {
  description = "The hostname or IP of the proxmox server"
  type        = string
  default     = "pve3.theboucher6.com"
}

variable "pm_node_name" {
  description = "name of the proxmox node to create the VMs on"
  type        = string
  default     = "pve3"
}

variable "pvt_key" {
  description = "private key file"
  type        = string
  default     = "priv_key"
}

variable "num_masters" {
  description = "Enter the number of Master VMs you want"
  default = 1
}


variable "num_masters_mem" {
  description = "Enter the value for the amount of RAM for your masters. ie. 4096"
  default = "4096"
}

variable "master_names" {
  description = "List of host names for master nodes"
  type        = list(string)
  default     = [
    "Elrond",
    "Galadriel",
    "Thranduil"
  ]
}

variable "master_desc" {
  description = "Node description to be added to notes"
  default = "Master Node"
}

variable "master_vmid_begin" {
  description = "Enter the number to begin with for selecting the vmid."
  default = 300
}

variable "master_disk_size" {
  description = "Enter the size of your Master node disks ie. 80G"
  type        = string
  default     = "80G"
}

variable "master_disk_type" {
  description = "What interface type are you using? ie. scsi"
  type        = string
  default     = "scsi"
}

variable "master_disk_location" {
  description = "Where do you want to store the disk on your host? ie. zfs-mirror, local, local-lvm, etc."
  type        = string
  default     = "Primary"
}

variable "num_nodes" {
  description = "Enter the number of VMs you want for worker nodes."
  default = 2
}

variable "num_nodes_mem" {
  description = "Enter the value for the amount of RAM for your worker nodes. ie. 2048"
  default = "4096"
}

variable "node_names" {
  description = "List of host names for worker nodes"
  type        = list(string)
  default     = [
    "Elladan",
    "Elrohir",
    "Celebrian",
    "Legolas"
  ]
}

variable "node_desc" {
  description = "Node description to be added to notes"
  default = "Worker Node"
}

variable "node_vmid_begin" {
  description = "Enter the number to begin with for selecting the vmid."
  default = 310
}

variable "node_disk_size" {
  description = "Enter the size of your Master node disks ie. 80G"
  type        = string
  default     = "80G"
}

variable "node_disk_type" {
  description = "What interface type are you using? ie. scsi"
  type        = string
  default     = "scsi"
}

variable "node_disk_location" {
  description = "Where do you want to store the disk on your host? ie. zfs-mirror, local, local-lvm, etc."
  type        = string
  default     = "Primary"
}

variable "template_vm_name" {
  description = "Name of the template VM"
  type        = string
  default     = "ubuntu-focal-template"
}

variable "master_ips" {
  description = "List of ip addresses for master nodes"
  type        = list(string)
  default     = [
    "192.168.1.80",
    "192.168.1.81",
    "192.168.1.82",
    "192.168.1.83",
    "192.168.1.84"
  ]
}

variable "worker_ips" {
  description = "List of ip addresses for worker nodes"
  type        = list(string)
  default     = [  
    "192.168.1.85",
    "192.168.1.86",
    "192.168.1.87",
    "192.168.1.88",
    "192.168.1.89"
  ]
}

variable "networkrange" {
  description = "Enter as 8,16,22,24,etc. hint: 10.0.0.0/8"
  default = 24
}

variable "gateway" {
  description = "Enter your network gateway."
  default = "192.168.1.1"
}
