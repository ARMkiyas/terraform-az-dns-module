terraform {

  required_version = ">= 1.1.0"

}




resource "azurerm_dns_cname_record" "cname_public_record" {
  count               = var.private_dns_zone == false ? length(var.cname_records) : 0
  name                = var.cname_records[count.index].name
  zone_name           = var.zone_name
  resource_group_name = var.Resource_Group_Name
  ttl                 = var.cname_records[count.index].ttl
  record              = var.cname_records[count.index].record
}


resource "azurerm_private_dns_cname_record" "cname_private_record" {
  count               = var.private_dns_zone == true ? length(var.cname_records) : 0
  name                = var.cname_records[count.index].name
  zone_name           = var.zone_name
  resource_group_name = var.Resource_Group_Name
  ttl                 = var.cname_records[count.index].ttl
  record              = var.cname_records[count.index].record
}


