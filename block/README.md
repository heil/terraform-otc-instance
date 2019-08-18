# Module terraform-otc-instance - block

A terraform module to provide an block instance in AWS without Provisioning.

## Module Input Variables

- `associate_public_ip_address` - (Optional) Wether to associate a public IP address with an instance in a VPC. Defaults to "true".
- `domain_name` - (Required) The DNS domain name of the instance..
- `hostname` - (Required) The DNS short name of the instance without the domain part.
- `private_ip` - (Required) The private IP address to associate with the instance in a VPC.
- `network_name` - (Required) The VPC Network ID to launch in.
- `tags` - (Optional) Dictionary of tags that will be added to all resources created by the module. Defaults to an empty map.
- `security_group_name` - (Required) A list of security group names to associate with.

## Usage

```lang=hcl
provider "opentelekomcloud" {
  access_key  = var.access_key
  auth_url    = var.auth_url
  domain_name = var.domain_name
  secret_key  = var.secret_key
  tenant_name = var.tenant_name
  version     = "~> 1.9"
}

data "opentelekomcloud_images_image_v2" "centos7" {
  name        = "Standard_CentOS_7_latest"
  most_recent = true
}

module "instance" {

  source = "../../../../../tarak/git/terraform-otc-instance/block"

  enabled     = true
  hostname    = "mongo01"
  domain_name = "${terraform.workspace}.domain.local"

  boot_volume_size = "10"
  flavor_name      = "s2.medium.2"
  image_id         = data.opentelekomcloud_images_image_v2.centos7.id
  key_pair         = data.opentelekomcloud_compute_bms_keypairs_v2.domain.name
  namespace        = var.organization
  network_name     = data.opentelekomcloud_vpc_subnet_v1.subnet.id

  private_ip = cidrhost(var.cidr[terraform.workspace], 29)

  security_groups = [
    opentelekomcloud_networking_secgroup_v2.mongodb.name
  ]
  stage = terraform.workspace

  volume_name        = "mongodb-${terraform.workspace}"
  volume_size        = 40
  volume_type        = "SATA"
  volume_mount_point = "/srv"
}
```

## Outputs

- `private_ip` - The private ip of the instance.
