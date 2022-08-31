variable "table" {
  description = "Name of the Table to be declared in DynamoBD"
  type        = string
  default     = "Tokens"
}

variable "hash_key" {
  description = "Hash_key for the dynamoDB table"
  type        = string
}

variable "range_key" {
  description = "Range_key for the dynamoDB table"
  type        = string
  default     = ""
}

variable "billing" {
  description = "The billing for the DynamoDB table, for choice between PROVISIONED or PAY_PER_REQUEST you should know the application traffic"
  default     = "PAY_PER_REQUEST"
}

variable "attributes" {
  description = "table attributes for a DynamoDB table"
  type = map(object({
    type = string
    name = string
  }))
}

variable "tags" {
  description = "Tags associated to the DynamoDB table"
  type        = map(string)
}