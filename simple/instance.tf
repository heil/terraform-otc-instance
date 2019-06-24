module "instance_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=master"
  attributes = var.attributes
  delimiter  = var.delimiter
  enabled    = var.enabled
  name       = "instance"
  namespace  = var.namespace
  stage      = var.stage
  tags       = var.tags
}

data "template_file" "init_mod" {
  template = "${file("${path.module}/../templates/cloud-init.tpl")}"

  vars = {
    domain_name = "${var.domain_name}"
    hostname    = "${var.hostname}"
  }
}

data "template_cloudinit_config" "mod" {
  base64_encode = true
  gzip          = true

  part {
    content      = "${data.template_file.init_mod.rendered}"
    content_type = "text/cloud-config"
  }
}

locals {
  tags = {
    Name = "${format("%s.%s", var.hostname, var.domain_name)}"
  }
}

resource "opentelekomcloud_networking_floatingip_v2" "floatip_1" {
  pool  = "admin_external_net"
  count = var.associate_public_ip_address ? 1 : 0
}

resource "opentelekomcloud_compute_floatingip_associate_v2" "fip_1" {
  count       = var.associate_public_ip_address ? 1 : 0
  floating_ip = "${opentelekomcloud_networking_floatingip_v2.floatip_1[0].address}"
  instance_id = "${opentelekomcloud_compute_instance_v2.mod.id}"
}

resource "opentelekomcloud_compute_instance_v2" "mod" {

  name = join(var.delimiter, [module.instance_label.id, var.hostname])

  flavor_name = "${var.flavor_name}"
  image_id    = "${var.image_id}"
  key_pair    = "${var.key_pair}"
  lifecycle {
    ignore_changes = ["user_data", "image_id"]
  }
  network {
    uuid        = "${var.network_name}"
    fixed_ip_v4 = var.private_ip
  }
  security_groups = "${var.security_groups}"
  user_data       = "${data.template_cloudinit_config.mod.rendered}"
}
