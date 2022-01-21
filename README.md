![banner](misc/banner.png)
# Digital Ocean GSuite Terraform Email Records
A simple terraform module for setting up GSuite email for a domain with digital ocean nameservers.


## Example Use
Here's an example of how to use it.

```terraform

resource "digitalocean_domain" "default" {
  name     = "example.com"
}

module "example_com_gsuite_email" {
    source "github.com/radicalsloth/digitalocean_gsuite_email_records"
    tld = "example.com"
}
```
