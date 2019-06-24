output "public_ip" {
  description = "the public ip if associated"
  value       = var.associate_public_ip_address ? opentelekomcloud_networking_floatingip_v2.floatip_1[0].address : ""
}
