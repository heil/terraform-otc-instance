# Module terraform-modules-aws-instance - simple

A terraform module to provide an instance in AWS, provisoned by Chef.

## Module Input Variables

- `ami` - (Required) The AMI to use for the instance.
- `associate_public_ip_address` - (Optional) Wether to associate a public IP address with an instance in a VPC. Defaults to "true".
- `connection_private_key` - (Required) The contents of an SSH key to use for the connection.
- `connection_user` - (Required) The user that should be used for the SSH connection.
- `domain_name` - (Required) The DNS domain name of the instance..
- `hostname` - (Required) The DNS short name of the instance without the domain part.
- `instance_type` - (Required) The type of instance to start.
- `private_ip` - (Required) The private IP address to associate with the instance in a VPC.
- `provisioner_environment` - (Required) The Chef environment the new node will be joining.
- `provisioner_fetch_chef_certificates` - (Optional) If true the SSL certificates configured on your Chef Server will be fetched and trusted. Defaults to "true".
- `provisioner_prevent_sudo` - (Optional) Wether to prevent the use of the sudo command while installing, configuring and running the initial Chef Client run. Defaults to "false".
- `provisioner_recreate_client` - (Optional) If true, first delete any existing Chef Node and Client before registering the new Chef Client. Defaults to "true".
- `provisioner_run_list` - (Required) A list with recipes or roles that will be invoked during the initial Chef Client run. The run-list will also be saved to the Chef Server after a successful initial run.
- `provisioner_secret_key` - (Required) The contents of the secret key that is used by the Chef Client to decrypt data bags on the Chef Server. The key will be uploaded to the remote machine.
- `provisioner_server_url` - (Required) The URL to the Chef server. This includes the path to the organization.
- `provisioner_user_key` - (Required) The contents of the user key that will be used to authenticate with the Chef Server.
- `provisioner_user_name` - (Required) The name of an existing Chef user to register the new Chef Client.
- `provisioner_version` - (Required) The Chef Client version to install on the remote machine.
- `subnet_id` - (Required) The VPC Subnet ID to launch in.
- `tags` - (Optional) Dictionary of tags that will be added to all resources created by the module. Defaults to an empty map.
- `vpc_security_group_ids` - (Required) A list of security group IDs to associate with.

## Usage

```lang=hcl
provider "aws" {
  profile = "comvel"
  region  = "eu-central-1"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "instance" {
  source = "../terraform-module-aws-instance//simple"

  ami                                 = "${data.aws_ami.ubuntu.id}"
  associate_public_ip_address         = true
  connection_private_key              = "${file("~/.ssh/id_rsa")}"
  connection_user                     = "ubuntu"
  domain_name                         = "remote.cloud"
  hostname                            = "instance2"
  instance_type                       = "t2.small"
  private_ip                          = "10.10.0.101"
  provisioner_environment             = "_default"
  provisioner_fetch_chef_certificates = false
  provisioner_prevent_sudo            = false
  provisioner_recreate_client         = true
  provisioner_run_list                = ["recipe[base]"]
  provisioner_secret_key              = "${file("~/.chef/encrypted_data_bag_secret")}"
  provisioner_server_url              = "https://chef.cloudformers.io/organizations/cloudformers"
  provisioner_user_key                = "${file("~/.chef/user.pem")}"
  provisioner_user_name               = "theil"
  provisioner_version                 = "12.18.31"
  subnet_id                           = "subnet-9d4a7b6c"
  vpc_security_group_ids              = ["sg-903004f8", "sg-1a2b3c4d"]
}
```

## Outputs

- `id` - The ID of the instance.
