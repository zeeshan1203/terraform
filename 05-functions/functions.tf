variable "fruits" {
  default = ["apple", "banana"]
}

output "number_of_fruits" {
  value = length(var.fruits)
}

output "first-value" {
  value = element(var.fruits, 0)
}
