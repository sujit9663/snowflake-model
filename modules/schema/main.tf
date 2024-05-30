terraform {
  required_providers {
    snowflake = {
      source                = "Snowflake-Labs/snowflake"
      version               = "~> 0.76"
      configuration_aliases = [snowflake.sysadmin]
    }
  }
}

resource "snowflake_schema" "schema" {
  provider            = snowflake.sysadmin
  for_each            = { for sc in local.config_data.schema_details : sc.schema_name => sc }
  database            = each.value.database_name
  name                = each.value.schema_name
  comment             = "Schema.........."
  is_transient        = false
  is_managed          = false
  data_retention_days = 1
}
