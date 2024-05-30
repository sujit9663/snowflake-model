terraform {
  required_providers {
    snowflake = {
      source                = "Snowflake-Labs/snowflake"
      version               = "0.86.0"
      configuration_aliases = [snowflake.sysadmin]
    }
  }
}

resource "snowflake_table" "tables" {
  provider = snowflake.sysadmin
  for_each = { for tb in local.config_data.tables_details : tb.table_name => tb }
  database = each.value.database_name
  schema   = each.value.schema_name
  name     = each.value.table_name

  dynamic "column" {
    for_each = each.value.columns
    content {
      name     = column.value.name
      type     = column.value.type
      nullable = false
    }
  }
}
