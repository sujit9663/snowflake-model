locals {
    #table_config_data = jsondecode(file("./modules/table/table.json"))
    config_data = jsondecode(file("./snowflake.json"))
}