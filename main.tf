module "database" {
  source = "./modules/database"
  providers = {
    snowflake.sysadmin = snowflake.sysadmin
  }
}

module "schema" {
  source = "./modules/schema"
  providers = {
    snowflake.sysadmin = snowflake.sysadmin
  }
  depends_on = [module.database]
}

module "table" {
  source = "./modules/table"
  providers = {
    snowflake.sysadmin = snowflake.sysadmin
  }
  depends_on = [module.schema]
}

module "warehouse" {
  source = "./modules/warehouse"
  providers = {
    snowflake.sysadmin = snowflake.sysadmin
  }
}

module "user" {
  source = "./modules/user"
  providers = {
    snowflake.securityadmin = snowflake.securityadmin
  }
  depends_on = [module.role]
}

module "role" {
  source = "./modules/role"
  providers = {
    snowflake.securityadmin = snowflake.securityadmin
  }
}

module "role_grants" {
  source = "./modules/role_grants"
  providers = {
    snowflake.securityadmin = snowflake.securityadmin
    snowflake.accountadmin  = snowflake.accountadmin
  }
  depends_on = [module.role]
}
