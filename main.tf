terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

locals {
  gmail_mx_records = [
    {
      "value"    = "aspmx.l.google.com."
      "priority" = 1
    },
    {
      "value"    = "alt1.aspmx.l.google.com."
      "priority" = 5
    },
    {
      "value"    = "alt2.aspmx.l.google.com."
      "priority" = 5
    },
    {
      "value"    = "alt3.aspmx.l.google.com."
      "priority" = 10
    },
    {
      "value"    = "alt4.aspmx.l.google.com."
      "priority" = 10
    },
  ]
}

resource "digitalocean_record" "mx_records" {
  for_each = {for record in local.gmail_mx_records: record.value => record}
  domain   = var.tld
  type     = "MX"
  ttl      = 1800
  name     = "@"
  priority = each.value.priority
  value    = each.value.value
}

resource "digitalocean_record" "ghp_spf" {
  domain = var.tld
  type   = "TXT"
  ttl    = 60
  name   = "@"
  value  = "v=spf1 include:_spf.google.com ~all"
}
