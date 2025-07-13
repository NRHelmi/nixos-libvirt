# 🚀 NixOS on Libvirt with Terraform

This project builds a NixOS virtual machine image using [`nixos-generate`](https://github.com/nix-community/nixos-generators) and deploys it using [Terraform](https://www.terraform.io/) with the [Libvirt provider](https://github.com/dmacvicar/terraform-provider-libvirt).


---

## 🔧 Requirements

- [Nix](https://nixos.org/)
- [Libvirt + QEMU/KVM](https://wiki.libvirt.org/)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- User in the `libvirt` group
- Nix flakes support optional

---

## 🧪 Development Shell

Start a development shell with all tools:

```bash
nix-shell
```

## 🖼️ Generate NixOS Image

Build the QCOW2 image:

```bash
make-boot-image
```

Output: image/nixos-cloudimg.qcow2/nixos.qcow2

## 🚀 Deploy with Terraform

Enter the Terraform directory:
```bash
cd terraform
terraform init
terraform apply
```

## 🧹 Clean Up

Destroy all created resources:

```bash
cd terraform
terraform destroy
```
