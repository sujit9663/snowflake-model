terraform {
  required_providers {
    snowflake = {
      source                = "Snowflake-Labs/snowflake"
      version               = "~> 0.35"
      configuration_aliases = [snowflake.sysadmin]
    }
  }
}

resource "snowflake_warehouse" "wh" {
  provider            = snowflake.sysadmin
  for_each            = { for wh in local.config_data.warehouses : wh.warehouse_name => wh }
  name                = each.value.warehouse_name
  comment             = each.value.comment
  warehouse_size      = each.value.size
  auto_resume         = true
  initially_suspended = true
}
