// without creating the DNS zone
module "A_record_nonZoneCreate" {
  count               = var.create_dns_zone == true ? 0 : 1
  source              = "./modules/A_record"
  Resource_Group_Name = var.resource_group_name
  zone_name           = var.zone_name
  a_records           = var.a_records
  private_dns_zone    = var.private_dns_zone

}

# with creating the DNS zone
module "A_record_withZoneCreate" {
  count               = var.create_dns_zone == true ? 1 : 0
  source              = "./modules/A_record"
  Resource_Group_Name = var.resource_group_name
  zone_name           = var.zone_name
  a_records           = var.a_records
  private_dns_zone    = var.private_dns_zone
  depends_on          = [azurerm_dns_zone.public_dns_zone, azurerm_private_dns_zone.private_dns_zone]

}
