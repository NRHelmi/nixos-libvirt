terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "~> 0.7"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_network" "nixos_net" {
  name      = "nixos-net"
  mode      = "nat"
  domain    = "nixos.local"
  addresses = ["192.168.100.0/24"]

  dhcp {
    enabled = true
  }
}

resource "libvirt_volume" "nixos" {
  name   = "nixos.qcow2"
  pool   = "default"
  source = "${path.module}/../image/nixos-cloudimg.qcow2/nixos.qcow2"
  format = "qcow2"
}

module "libvirt_vm" {
  source = "./modules/libvirt_virtual_machine"

  name   = "nixos"
  memory = 2048
  vcpu   = 2

  network_id = libvirt_network.nixos_net.id
  volume_id     = libvirt_volume.nixos.id
}
