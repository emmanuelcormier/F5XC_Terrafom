// ==========================================================================
// Definition of the Origin Pool
//
resource "volterra_origin_pool" "pool-arcadia" {
  name                   = var.pool_name
  //Name of the namespace where the origin pool must be deployed
  namespace              = var.namespace
  
   origin_servers {

    public_name {
      dns_name = var.origin_pool_fqdn
    }

    labels = {
    }
  }

  use_tls {
    use_host_header_as_sni = true
    skip_server_verification = true
    no_mtls = true
    tls_config {
      default_security = true
    }
  }
  port = "443"
  endpoint_selection     = "LOCAL_PREFERED"
  loadbalancer_algorithm = "LB_OVERRIDE"
}

// ==========================================================================
// Definition of the WAAP Policy
//
resource "volterra_app_firewall" "waap-arcadia" {
  name      = var.waap_policy
  namespace = var.namespace
  
  // One of the arguments from this list "allow_all_response_codes allowed_response_codes" must be set
  allow_all_response_codes = true
  // One of the arguments from this list "default_anonymization custom_anonymization disable_anonymization" must be set
  default_anonymization = true
  // One of the arguments from this list "use_default_blocking_page blocking_page" must be set
  blocking_page {
    blocking_page = "string:///PHN0eWxlPmJvZHkgeyBmb250LWZhbWlseTogU291cmNlIFNhbnMgUHJvLCBzYW5zLXNlcmlmOyB9PC9zdHlsZT4KPGh0bWwgc3R5bGU9Im1hcmdpbjogMDsiPjxoZWFkPjx0aXRsZT5SZWplY3RlZCBSZXF1ZXN0PC90aXRsZT48L2hlYWQ+Cjxib2R5IHN0eWxlPSJtYXJnaW4gOiAwOyI+CjxkaXYgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6ICMwNDZiOTk7IGhlaWdodDogNDBweDsgd2lkdGg6IDEwMCU7Ij48L2Rpdj4KPGRpdiBzdHlsZT0ibWluLWhlaWdodDogMTAwcHg7IGJhY2tncm91bmQtY29sb3I6IHdoaXRlOyB0ZXh0LWFsaWduOiBjZW50ZXI7Ij48L2Rpdj4KPGRpdiBzdHlsZT0iYmFja2dyb3VuZC1jb2xvcjogI2ZkYjgxZTsgaGVpZ2h0OiA1cHg7IHdpZHRoOiAxMDAlOyI+PC9kaXY+CjxkaXYgaWQ9Im1haW4tY29udGVudCIgc3R5bGU9IndpZHRoOiAxMDAlOyAiPgogIDx0YWJsZSB3aWR0aD0iMTAwJSI+CiAgICA8dHI+PHRkIHN0eWxlPSJ0ZXh0LWFsaWduOiBjZW50ZXI7Ij4KCSAgPGRpdiBzdHlsZT0ibWFyZ2luLWxlZnQ6IDUwcHg7Ij4KICAgICAgICA8ZGl2IHN0eWxlPSJtYXJnaW4tYm90dG9tOiAzNXB4OyI+PGJyLz4KICAgICAgICAgIDxzcGFuIHN0eWxlPSJmb250LXNpemU6IDQwcHQ7IGNvbG9yOiAjMDQ2Yjk5OyI+UmVqZWN0ZWQgUmVxdWVzdDwvc3Bhbj4KICAgICAgICA8L2Rpdj4KICAgICAgICA8ZGl2IHN0eWxlPSJmb250LXNpemU6IDE0cHQ7Ij4KICAgICAgICAgIDxwPlRoZSByZXF1ZXN0ZWQgVVJMIHdhcyByZWplY3RlZC4gUGxlYXNlIGNvbnN1bHQgd2l0aCB5b3VyIGFkbWluaXN0cmF0b3IuPC9wPgogICAgICAgICAgPHA+WW91ciBTdXBwb3J0IElEIGlzOiA8c3BhbiBzdHlsZT0iY29sb3I6cmVkOyBmb250LXdlaWdodDpib2xkIj57e3JlcXVlc3RfaWR9fTwvc3Bhbj48L3A+CgkJICA8cD48YSBocmVmPSJqYXZhc2NyaXB0Omhpc3RvcnkuYmFjaygpIj5bR28gQmFja108L2E+PC9wPgogICAgICAgICAgPHA+PGltZyBzcmM9Imh0dHBzOi8vaW1hZ2Uuc3ByZWFkc2hpcnRtZWRpYS5uZXQvaW1hZ2Utc2VydmVyL3YxL21wL3Byb2R1Y3RzL1QxNDU5QTgzOU1QQTQ0NTlQVDI4RDE4OTUwMTU4MEZTMTU2NC92aWV3cy8xLHdpZHRoPTU1MCxoZWlnaHQ9NTUwLGFwcGVhcmFuY2VJZD04MzksYmFja2dyb3VuZENvbG9yPUYyRjJGMi9jYXQtcGV3LXBldy1tYWRhZmFrYXMtYXV0b2NvbGxhbnQuanBnIj48L3A+CiAgICAgICAgPC9kaXY+CiAgICAgIDwvZGl2PgogICAgPC90ZD48L3RyPgogIDwvdGFibGU+CjwvZGl2Pgo8ZGl2IHN0eWxlPSJiYWNrZ3JvdW5kLWNvbG9yOiAjMjIyMjIyOyBwb3NpdGlvbjogZml4ZWQ7IGJvdHRvbTogMHB4OyBoZWlnaHQ6IDQwcHg7IHdpZHRoOiAxMDAlOyB0ZXh0LWFsaWduOiBjZW50ZXI7Ij48L2Rpdj4KPC9ib2R5Pgo8L2h0bWw+"
  }
  // One of the arguments from this list "default_bot_setting bot_protection_setting" must be set
  bot_protection_setting {
    malicious_bot_action = "BLOCK"
    suspicious_bot_action = "BLOCK"
    good_bot_action = "REPORT"
  }
  // One of the arguments from this list "default_detection_settings detection_settings" must be set
  detection_settings {
    signature_selection_setting {
      default_attack_type_settings = true
      high_medium_low_accuracy_signatures = true
    }
    enable_suppression = true
    enable_threat_campaigns = true
    default_violation_settings = true
  }
  // One of the arguments from this list "use_loadbalancer_setting blocking monitoring" must be set
  use_loadbalancer_setting = true
  // Blocking mode - optional - if not set, policy is in MONITORING
  blocking = true
}

// ==========================================================================
// Definition of the Load-Balancer
//
resource "volterra_http_loadbalancer" "lb-https-bot" {
  depends_on = [volterra_origin_pool.pool-arcadia]
  //Mandatory "Metadata"
  name      = var.lb_https
  //Name of the namespace where the origin pool must be deployed
  namespace = var.namespace
  
  //End of mandatory "Metadata" 
  //Mandatory "Basic configuration" with Auto-Cert 
  domains = [var.lb_domains]
  https_auto_cert {
    add_hsts = true
    http_redirect = false
    no_mtls = true
    enable_path_normalize = true
    tls_config {
        default_security = true
      }
  }
  default_route_pools {
      pool {
        name = var.pool_name
        namespace = var.namespace
      }
      weight = 1
  }
  //Mandatory "VIP configuration"
  advertise_on_public_default_vip = true
  //End of mandatory "VIP configuration"
  //Mandatory "Security configuration"
  no_service_policies = true
  no_challenge = true
  disable_rate_limit = true
  //WAAP Policy reference, created earlier in this plan - refer to the same name
  app_firewall {
    name = var.waap_policy
    namespace = var.namespace
  }
  //Advanced Bot Protection Profile
  bot_defense {
    regional_endpoint = "EU"
    timeout = 1000
    policy {
      js_download_path = "/arcadia-bot.js"
      js_insert_all_pages {
        javascript_location = "AFTER_HEAD"
      }
      protected_app_endpoints {
          metadata {
            name = "buy-stocks"
          }
          http_methods = ["POST"]
          protocol = "BOTH"
          any_domain = true
          path {
            prefix = "/trading/rest/buy-stocks.php"
          }
          mitigation {
            block {
              status = "PaymentRequired"
              body = "string:///VGhlIHJlcXVlc3RlZCBVUkwgd2FzIHJlamVjdGVkIGJ5IEY1WEMgQm90IERlZmVuc2UuIFBsZWFzZSBjb25zdWx0IHdpdGggeW91ciBhZG1pbmlzdHJhdG9yLg=="
            }
          }
      }
    }
  }
  multi_lb_app = true
  user_id_client_ip = true
  //End of mandatory "Security configuration"
  //Mandatory "Load Balancing Control"
  source_ip_stickiness = false
  round_robin = true
}

//End of the file
//==========================================================================