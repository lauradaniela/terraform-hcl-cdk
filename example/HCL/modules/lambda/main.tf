resource "aws_dynamodb_table" "dynamodb_table" {
  name             = var.table
  billing_mode     = var.billing

  tags = merge(var.tags, tomap({ "name" = format("%s", var.table) }))

  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  hash_key  = var.hash_key
  range_key = var.range_key

}