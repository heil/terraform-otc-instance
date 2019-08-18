variable "associate_public_ip_address" {
  description = "Wether to associate a public IP address with an instance in a VPC."
  default     = false
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "boot_volume_type" {
  type        = string
  default     = "SATA"
  description = "can be SATA, SAS, SSD"
}

variable "boot_volume_size" {
  type        = string
  description = "Size of the Boot-Volume in GB"
}

variable "delete_on_termination" {
  description = "Delete Volume on Termination"
  default     = false
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "domain_name" {
  description = "The DNS domain name of the instance."
  type        = "string"
}

variable "flavor_name" {
  description = "The name of the flavor e.g. s2.medium.1."
  type        = "string"
}

variable "enabled" {
  description = "is this module enabled"
  type        = bool
  default     = false
}

variable "hostname" {
  description = "The DNS short name of the instance without the domain part."
  type        = "string"
}

variable "image_id" {
  description = "The UUID for the image to use."
  type        = "string"
}

variable "key_pair" {
  description = "The Name of a keypair"
  type        = "string"
}

variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "network_name" {
  description = "The Name for the network to use."
  type        = "string"
}

variable "private_ip" {
  description = "The private IP address to associate with the instance in a VPC."
  type        = "string"
  default     = ""
}

variable "security_groups" {
  description = "A list of security group names to associate with."
  type        = "list"
}

variable "stage" {
  type        = string
  default     = ""
  description = "Stage, e.g. 'prod', 'staging', 'dev'"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}

variable "volume_name" {
  type        = "string"
  description = "name of the Volume to find it back later"
}

variable "volume_size" {
  type        = "string"
  description = "Size of the Volume in GB"
}

variable "volume_type" {
  type        = string
  default     = "SATA"
  description = "Type of the Data-Volume. Can be SATA, SSD, SAS"
}

variable "volume_device" {
  description = "The name of the device to mount."
  type        = "string"
  default     = "/dev/vdb"
}

variable "volume_filesystem" {
  description = "The filesystem for the volume"
  type        = "string"
  default     = "ext4"
}

variable "volume_mount_point" {
  description = "The mount point where the volume is mounted in the instance."
  type        = "string"
}
