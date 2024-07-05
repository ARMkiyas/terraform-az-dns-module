terraform {

  required_version = ">= 1.1.0"

}


resource "azurerm_dns_aaaa_record" "AAAA_record_public" {
  count               = var.private_dns_zone == false ? length(var.aaaa_records) : 0
  name                = var.aaaa_records[count.index].name
  zone_name           = var.zone_name
  resource_group_name = var.Resource_Group_Name
  ttl                 = var.aaaa_records[count.index].ttl
  records             = var.aaaa_records[count.index].records
}

resource "azurerm_private_dns_aaaa_record" "AAAA_record_private" {
  count               = var.private_dns_zone == true ? length(var.aaaa_records) : 0
  name                = var.aaaa_records[count.index].name
  zone_name           = var.zone_name
  resource_group_name = var.Resource_Group_Name
  ttl                 = var.aaaa_records[count.index].ttl
  records             = var.aaaa_records[count.index].records


}

