locals {
  config_data = yamldecode(file("./snowflake.json"))
}