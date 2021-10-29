data "aws_dynamodb_table" "table" {
  name = "terraform"
}

output "table" {
  value = data.aws_dynamodb_table.table
}