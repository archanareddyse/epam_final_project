provider "aws" {
	region = var.aws_region
        access_key = "AKIAQUPGWERV2YC76QUA"
        secret_key = "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"
}

module "my_instance_module" {
        source = "./my_modules/modules"
        ami = "ami-07eaf27c7c4a884cf"
        instance_type = "t2.micro"
        instance_name = "myvm01"
        
}