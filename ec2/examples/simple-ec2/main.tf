module "ec2_instance" {
  source  = "../../"

  name = "single-instance"

  ami                    = "ami-090fa75af13c156b4"
  instance_type          = "t2.micro"
  key_name               = "teste-ec2"
  monitoring             = false

  tags = {
    ManagedBy   = "Terraform"
    Environment = "dev"
  }
}