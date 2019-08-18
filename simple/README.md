# Module terraform-modules-aws-instance - simple

A terraform module to provide an instance in AWS, provisoned by Chef.

## Module Input Variables

- `associate_public_ip_address` - (Optional) Wether to associate a public IP address with an instance in a VPC. Defaults to "true".
- `domain_name` - (Required) The DNS domain name of the instance.
- `flavor_name` - (Required) The name of the flavor e.g. s2.medium.1.
- `hostname` - (Required) The DNS short name of the instance without the
domain part.
- `image_id` - (Required) The UUID for the image to use.
- `image_size` - (Required)  The size for for volume based on the image to use in GB.
- `key_pair` - (Required) - The Name of a ssh keypair.
- `private_ip` - (Required) The private IP address to associate with the instance in a VPC.
- `network_name` - (Required) The Name for the network to use.
- `security_groups` - (Required) A list of security group IDs to associate with.
- `tags` - (Optional) Dictionary of tags that will be added to all resources created by the module. Defaults to an empty map.

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

data "opentelekomcloud_images_image_v2" "ubuntu_18_04" {
  name        = "Standard_Ubuntu_18.04_latest"
  most_recent = true
}

module "instance" {

  source    = "../../../terraform-otc-instance//simple"
  hostname  = "test"
  associate_public_ip_address = true
  domain_name  = "${terraform.workspace}.domain.local"
  enabled      = true
  flavor_name  = "s2.medium.1"
  image_id     = "${data.opentelekomcloud_images_image_v2.ubuntu_18_04.id}"
  image_size   = "40"
  key_pair     = "${data.opentelekomcloud_compute_bms_keypairs_v2.local.name}"
  namespace    = var.organization
  network_name = data.opentelekomcloud_vpc_subnet_v1.subnet.id

  private_ip = "10.48.0.9"

  security_groups = [
    "${opentelekomcloud_networking_secgroup_v2.base.name}"
  ]
  stage = terraform.workspace
}
```

## Outputs

- `public_ip` - he public ip if associated.
