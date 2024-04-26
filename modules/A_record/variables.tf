

variable "Resource_Group_Name" {
  type        = string
  description = "(Required) Specifies the resource group where the DNS Zone (parent resource) exists. Changing this forces a new resource to be created."
  nullable    = false

}

variable "zone_name" {
  type        = string
  description = "(Required) Specifies the DNS Zone where the resource exists. Changing this forces a new resource to be created."
  nullable    = false

}

variable "a_records" {
  type = list(
    object({
      name    = string
      ttl     = number
      records = list(string)
    })
  )
  description = "Specifies a list of A records to create in the specified DNS zone."
  default     = []
  nullable    = false
}


variable "private_dns_zone" {
  type        = bool
  description = "(Optional) Specifies if the DNS Zone should be a private DNS Zone. Defaults to false."
  default     = false

}
