
output "aaaa_records_id" {

  value = var.private_dns_zone ? azurerm_private_dns_aaaa_record.AAAA_record_private.*.id : azurerm_dns_aaaa_record.AAAA_record_public.*.id
}

output "aaaa_records_name" {
  value = var.private_dns_zone ? azurerm_private_dns_aaaa_record.AAAA_record_private.*.name : azurerm_dns_aaaa_record.AAAA_record_public.*.name
}
