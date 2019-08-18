variable "associate_public_ip_address" {
  description = "Wether to associate a public IP address with an instance in a VPC."
  default     = false
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "image_id" {
  description = "The UUID for the image to use."
  type        = "string"
}

variable "image_size" {
  description = "The size for for volume based on the image to use in GB."
  type        = "string"
}

variable "flavor_name" {
  description = "The name of the flavor e.g. s2.medium.1."
  type        = "string"
}

variable "key_pair" {
  description = "The Name of a keypair"
  type        = "string"
}

variable "network_name" {
  description = "The Name for the network to use."
  type        = "string"
}


variable "domain_name" {
  description = "The DNS domain name of the instance."
  type        = "string"
}

variable "hostname" {
  description = "The DNS short name of the instance without the domain part."
  type        = "string"
}

variable "enabled" {
  description = "is this module enabled"
  type        = bool
  default     = false
}

variable "security_groups" {
  description = "A list of security group names to associate with."
  type        = "list"
}

variable "private_ip" {
  description = "The private IP address to associate with the instance in a VPC."
  type        = "string"
  default     = ""
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}

variable "namespace" {
  type        = string
  default     = ""
  description = "Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp'"
}

variable "stage" {
  type        = string
  default     = ""
  description = "Stage, e.g. 'prod', 'staging', 'dev'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}
