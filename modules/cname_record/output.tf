output "cnmae_records_id" {
  value = var.private_dns_zone ? azurerm_private_dns_cname_record.cname_private_record[*].id : azurerm_dns_cname_record.cname_public_record[*].id
}

output "cname_records_name" {
  value = var.private_dns_zone ? azurerm_private_dns_cname_record.cname_private_record[*].name : azurerm_dns_cname_record.cname_public_record[*].name
}


