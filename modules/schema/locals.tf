locals {
  config_data = jsondecode(file("./snowflake.json"))
}
