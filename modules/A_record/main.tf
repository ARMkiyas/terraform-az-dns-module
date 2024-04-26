terraform {

  required_version = ">= 1.1.0"

}


resource "azurerm_dns_a_record" "A_record_public" {
  count               = var.private_dns_zone == false ? length(var.a_records) : 0
  name                = var.a_records[count.index].name
  zone_name           = var.zone_name
  resource_group_name = var.Resource_Group_Name
  ttl                 = var.a_records[count.index].ttl
  records             = var.a_records[count.index].records
}

resource "azurerm_private_dns_a_record" "A_record_private" {
  count               = var.private_dns_zone == true ? length(var.a_records) : 0
  name                = var.a_records[count.index].name
  zone_name           = var.zone_name
  resource_group_name = var.Resource_Group_Name
  ttl                 = var.a_records[count.index].ttl
  records             = var.a_records[count.index].records


}
