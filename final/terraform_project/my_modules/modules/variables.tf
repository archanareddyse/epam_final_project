variable "ami" {
  type          = string
  default       = "ami-07eaf27c7c4a884cf"
  
}

variable "instance_type" {
  type          = string
  default       = "t2.micro"
  
}

variable "instance_name" {
  description   = "Value of the Name tag for the EC2 instance"
  type          = string
  default       = "ExampleInstance"
  
}

