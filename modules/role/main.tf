terraform {
  required_providers {
    snowflake = {
      source                = "Snowflake-Labs/snowflake"
      version               = "~> 0.76"
      configuration_aliases = [snowflake.securityadmin]
    }
  }
}

resource "snowflake_role" "role" {
  provider = snowflake.securityadmin
  for_each = { for rl in local.config_data.roles_details : rl.role_name => rl }
  name     = each.value.role_name

}


// assign custom role to sysadmin role
resource "snowflake_role_grants" "grants" {
  provider  = snowflake.securityadmin
  for_each  = snowflake_role.role
  role_name = each.value.name

  roles = [
    "SYSADMIN"
  ]

}

