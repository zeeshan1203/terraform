data "aws_dynamodb_table" "table" {
  name          = "terraform"           ##urs dynamodb table name
}

output "table" {
  value         = data.aws_dynamodb_table.table
}