variable "api_cert" {
  type = string
  default = "//Users/E.CORMIER/Downloads/Terraform/F5XC/terraform-volterra/my_cert.crt"
}
        
variable "api_key" {
  type = string
  default = "//Users/E.CORMIER/Downloads/Terraform/F5XC/terraform-volterra/my_cert.key"
}
        
variable "api_url" {
  type = string
  default = "https://f5-emea-ent.console.ves.volterra.io/api"
}

variable "namespace" {
  type = string
  default = "e-cormier"
}

variable "pool_name" {
  type = string
  default = "pool-arcadia-manu"
}

variable "origin_pool_fqdn" {
  type = string
  default = "arcadia.emea.f5se.com"
}

variable "lb_https" {
  type = string
  default = "lb-arcadia-manu"
}

variable "waap_policy" {
  type = string
  default = "waap-arcadia-manu"
}

variable "lb_domains" {
  type = string
  default = "arcadia-ecormier.emea-ent.f5demos.com"
}
