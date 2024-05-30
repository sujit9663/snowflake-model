locals {
  #config_data = jsondecode(file("./modules/database/user_input.json"))
  config_data = jsondecode(file("./snowflake.json"))
}