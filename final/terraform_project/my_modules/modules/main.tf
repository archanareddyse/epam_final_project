resource "aws_instance" "my_instance" {
	ami = var.ami
	instance_type = var.instance_type
    count = 2
	key_name = "demo12"
}


