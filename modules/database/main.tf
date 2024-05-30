terraform {
  required_providers {
    snowflake = {
      source                = "Snowflake-Labs/snowflake"
      version               = "~> 0.76"
      configuration_aliases = [snowflake.sysadmin]
    }
  }
}

resource "snowflake_database" "db" {
  provider  = snowflake.sysadmin
  for_each  = { for db in local.config_data.databases_details : db.database_name => db }
  name      = each.value.database_name
}
