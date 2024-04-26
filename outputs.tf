

output "zone_id" {
  value = var.create_dns_zone == true && !var.private_dns_zone ? azurerm_dns_zone.public_dns_zone.*.id : azurerm_private_dns_zone.private_dns_zone.*.id

}

output "zone_name" {
  value = var.create_dns_zone == true && !var.private_dns_zone ? azurerm_dns_zone.public_dns_zone.*.name : azurerm_private_dns_zone.private_dns_zone.*.name
}


output "A_record_id" {
  value = var.a_records != [] ? (var.create_dns_zone == true ? module.A_record_withZoneCreate.*.a_records_id : module.A_record_nonZoneCreate.*.a_records_id) : null

}


output "A_record_name" {
  description = "A record name"
  value       = var.a_records != [] ? (var.create_dns_zone == true ? module.A_record_withZoneCreate.*.a_records_name : module.A_record_nonZoneCreate.*.a_records_name) : null

}

output "AAAA_record_id" {
  value = var.aaaa_records != [] ? (var.create_dns_zone == true ? module.AAAA_record_withZoneCreate.*.aaaa_records_id : module.AAAA_record_noZoneCreate.*.aaaa_records_id) : null

}

output "AAAA_record_name" {
  value = var.aaaa_records != [] ? (var.create_dns_zone == true ? module.AAAA_record_withZoneCreate.*.aaaa_records_name : module.AAAA_record_noZoneCreate.*.aaaa_records_name) : null
}

