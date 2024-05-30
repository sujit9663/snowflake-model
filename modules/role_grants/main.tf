terraform {
  required_providers {
    snowflake = {
      source                = "Snowflake-Labs/snowflake"
      version               = "~> 0.76"
      configuration_aliases = [snowflake.accountadmin, snowflake.securityadmin]
    }
  }
}

resource "snowflake_warehouse_grant" "grant" {
  provider        = snowflake.securityadmin
  for_each        = { for rl in local.config_data.grants_on_warehouse : rl.Key => rl }
  warehouse_name  = each.value.warehouse_name
  roles           = each.value.role_name

  privilege       = each.value.privileges
  
  with_grant_option = false
}


resource "snowflake_database_grant" "grant" {
  provider      = snowflake.securityadmin
  for_each      = { for rl in local.config_data.grants_on_database : rl.Key => rl }
  database_name = each.value.database_name

  privilege         = each.value.privileges
  roles             = each.value.role_name
  with_grant_option = false
}

resource "snowflake_schema_grant" "grant" {
  provider          = snowflake.securityadmin
  for_each          = { for rl in local.config_data.grants_on_schema : rl.Key => rl }
  database_name     = each.value.database_name
  schema_name       = each.value.schema_name
  privilege         = each.value.privileges
  roles             = each.value.role_name
  with_grant_option = false
}

resource "snowflake_table_grant" "grant" {
  provider      = snowflake.securityadmin
  for_each      = { for rl in local.config_data.grants_on_table : rl.Key => rl }
  database_name = each.value.database_name
  schema_name   = each.value.schema_name
  table_name    = each.value.table_name

  privilege = each.value.privileges
  roles     = each.value.role_name

  with_grant_option = false
}
