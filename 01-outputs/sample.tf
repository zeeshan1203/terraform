output "sample" {
  //value = "Hello World"
  value = var.sample
}

output "sample1" {
  value = "${var.sample} Welcome you"
}

variable "sample" {
  default = "Hello World"
}

## Variable sample can be accessed as var.sample or ${var.sample}, However
## var.sample is used without quotes
## ${var.sample} is used within quotes.
## Usually ${} used only when you combine with some other data
## Single quotes does not support by terraform at any level. Supports only double quotes.

# String Data type
variable "sample1" {
  default = "Hello World"
}

# Number data type
variable "sample2" {
  default = 100
}

# Boolean Data type
variable "sample3" {
  default = true
}

variable "sample4" {
  default =  [
    "Hello",
    1000,
    true,
    "World"
  ]
}

output "sample4" {
  value = var.sample4[1]
}

variable "sample5" {
  default =  {
    string = "Hello",
    number = 100,
    boolean = true
  }
}

output "sample5" {
  value = var.sample5["boolean"]
}

variable "sample6" {}

output "sample6" {
  value = var.sample6
}
