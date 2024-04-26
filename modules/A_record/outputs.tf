
output "a_records_id" {

  value = var.private_dns_zone ? azurerm_private_dns_a_record.A_record_private.*.id : azurerm_dns_a_record.A_record_public.*.id
}

output "a_records_name" {
  value = var.private_dns_zone ? azurerm_private_dns_a_record.A_record_private.*.name : azurerm_dns_a_record.A_record_public.*.name
}

