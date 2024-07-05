Here's the updated README including the AAAA records:

---

# Azure DNS Terraform Module

This Terraform module manages DNS zones and records in Azure. It allows you to create new public or private DNS zones and add DNS records in bulk to new or existing DNS zones.

## Features

- Create new public or private DNS zones.
- Add multiple DNS records (A, AAAA, CNAME, MX) to a new or existing DNS zone.
- Supports tagging of DNS zones.
- Other DNS record types will be available in future versions.

## Usage

### Create a New Public DNS Zone and Add Records

```hcl
module "dns_zone" {
  source = "https://github.com/ARMkiyas/terraform-az-dns-module.git"

  resource_group_name = "example-resources"
  zone_name           = "example.com"
  create_dns_zone     = true
  private_dns_zone    = false

  a_records = [
    {
      name    = "www"
      ttl     = 300
      records = ["192.0.2.1"]
    },
  ]

  aaaa_records = [
    {
      name    = "ipv6"
      ttl     = 300
      records = ["2001:0db8:85a3:0000:0000:8a2e:0370:7334"]
    },
  ]

  cname_records = [
    {
      name   = "blog"
      ttl    = 300
      record = "blog.example.com"
    },
  ]

  mx_records = {
    "mail" = {
      ttl  = 3600
      preference = 10
      exchange   = "mail.example.com."
    }
  }

  zone_tags = {
    environment = "production"
    project     = "example-project"
  }
}
```

### Add Records to an Existing DNS Zone

```hcl
module "dns_zone" {
  source = "https://github.com/ARMkiyas/terraform-az-dns-module.git"

  resource_group_name = "example-resources"
  zone_name           = "existing-zone.com"
  create_dns_zone     = false

  a_records = [
    {
      name    = "api"
      ttl     = 300
      records = ["192.0.2.2"]
    },
  ]

  aaaa_records = [
    {
      name    = "ipv6-api"
      ttl     = 300
      records = ["2001:0db8:85a3:0000:0000:8a2e:0370:7335"]
    },
  ]

  cname_records = [
    {
      name   = "shop"
      ttl    = 300
      record = "shop.example.com"
    },
  ]

  mx_records = {
    "mail" = {
      ttl  = 3600
      preference = 10
      exchange   = "mail.example.com."
    }
  }
}
```

## Inputs

| Name                | Description                                                                 | Type                                                                                                                                         | Default | Required |
|---------------------|-----------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|---------|----------|
| `resource_group_name` | Specifies the resource group where the DNS Zone (parent resource) exists.   | `string`                                                                                                                                      | n/a     | yes      |
| `zone_name`           | Specifies the DNS Zone where the resource exists.                            | `string`                                                                                                                                      | n/a     | yes      |
| `create_dns_zone`     | Whether or not to create the DNS zone.                                       | `bool`                                                                                                                                        | `true`  | no       |
| `private_dns_zone`    | Whether or not the created DNS zone is private.                              | `bool`                                                                                                                                        | `false` | no       |
| `a_records`           | Specifies a list of A records to create in the specified DNS zone.           | `list(object({ name = string, ttl = number, records = list(string) }))`                                                                       | `[]`    | no       |
| `aaaa_records`        | Specifies a list of AAAA records to create in the specified DNS zone.        | `list(object({ name = string, ttl = number, records = list(string) }))`                                                                       | `[]`    | no       |
| `cname_records`       | Specifies a list of CNAME records to create in the specified DNS zone.       | `list(object({ name = string, ttl = number, record = string }))`                                                                              | `[]`    | no       |
| `mx_records`          | Specifies a map of MX records to create in the specified DNS zone.           | `map(object({ ttl = number, preference = number, exchange = string }))`                                                                       | `{}`    | no       |
| `zone_tags`           | A mapping of tags to assign to the created DNS zone.                         | `map(string)`                                                                                                                                 | `{}`    | no       |

## Outputs

| Name         | Description                      |
|--------------|----------------------------------|
| `zone_id`    | The ID of the DNS zone           |
| `zone_name`  | The name of the DNS zone         |
| `records`    | The DNS records that were added  |

## Example

```hcl
module "dns_example" {
  source = "https://github.com/ARMkiyas/terraform-az-dns-module.git"

  resource_group_name = "example-resources"
  zone_name           = "example.com"
  create_dns_zone     = true
  private_dns_zone    = false

  a_records = [
    {
      name    = "www"
      ttl     = 300
      records = ["192.0.2.1"]
    },
  ]

  aaaa_records = [
    {
      name    = "ipv6"
      ttl     = 300
      records = ["2001:0db8:85a3:0000:0000:8a2e:0370:7334"]
    },
  ]

  cname_records = [
    {
      name   = "blog"
      ttl    = 300
      record = "blog.example.com"
    },
  ]

  mx_records = {
    "mail" = {
      ttl  = 3600
      preference = 10
      exchange   = "mail.example.com."
    }
  }

  zone_tags = {
    environment = "production"
    project     = "example-project"
  }
}
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to adjust this template according to your specific needs and development progress.
