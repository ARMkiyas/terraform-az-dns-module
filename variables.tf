

variable "resource_group_name" {
  type        = string
  description = "(Required) Specifies the resource group where the DNS Zone (parent resource) exists. Changing this forces a new resource to be created."
  nullable    = false
}


variable "zone_name" {
  type        = string
  description = "(Required) Specifies the DNS Zone where the resource exists. Changing this forces a new resource to be created."
  nullable    = false

}


// only for creating the DNS zone by default public zone is created
variable "create_dns_zone" {
  type        = bool
  description = "(Optional) Whether or not create the DNS zone."
  default     = true

}

variable "private_dns_zone" {
  type        = bool
  description = "(Optional) Whether or not the created DNS zone is public."
  default     = false
}

variable "a_records" {
  type = list(
    object({
      name    = string
      ttl     = number
      records = list(string)
    })
  )
  description = "(Optional) Specifies a list of A records to create in the specified DNS zone."
  default     = []
}

variable "aaaa_records" {
  type = list(
    object({
      name    = string
      ttl     = number
      records = list(string)
    })
  )
  description = "(Optional) Specifies a list of AAAA records to create in the specified DNS zone."
  default     = []
}

variable "cname_records" {
  type = list(
    object({
      name    = string
      ttl     = number
      record = string
    })
  )
  description = "Specifies a list of A records to create in the specified DNS zone."
  default     = []

}


variable "mx_records" {
  type        = any
  description = "(Optional) Specifies a map of MX records to create in the specified DNS zone."
  default     = {}
}


variable "zone_tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags to assign to the created DNS zone."
  default     = {}
}
