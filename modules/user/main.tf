terraform {
  required_providers {
    snowflake = {
      source                = "Snowflake-Labs/snowflake"
      version               = "~> 0.76"
      configuration_aliases = [snowflake.securityadmin]
    }
  }
}
resource "snowflake_user" "user" {
  provider             = snowflake.securityadmin
  for_each             = { for rl in local.config_data.users : rl.username => rl }
  name                 = each.value.username
  login_name           = each.value.login_name
  comment              = each.value.comment
  password             = each.value.password
  disabled             = false
  display_name         = each.value.login_name
  email                = each.value.email
  first_name           = each.value.first_name
  last_name            = each.value.last_name
  must_change_password = true
}

resource "snowflake_role_grants" "user_grants" {
  provider = snowflake.securityadmin
  for_each = { for rl in local.config_data.assign_roles : rl.key => rl }

  role_name = each.value.rolename
  users = [
    each.value.username
  ]
  depends_on = [snowflake_user.user]
}
