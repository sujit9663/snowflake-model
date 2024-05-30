variable "account" {
  type        = string
  description = "Snowflake account name to connect to, along with the region to which the account belongs"
  default     = "RF98143"
}

variable "region" {
  type        = string
  description = "Region of the Snowflake account that is being used."
  default     = "ap-south-1"
}
