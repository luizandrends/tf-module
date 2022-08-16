module "ec2_instance" {
  source = "../../"

  name = "single-instance"

  ami                    = "ami-090fa75af13c156b4"
  instance_type          = "t2.micro"
  key_name               = "teste-ec2"
  monitoring             = true
  vpc_security_group_ids = ["sg-055ae74da00e6bb54"]
  subnet_id              = "subnet-05c3f49ee1ba9ff2f"

  tags = {
    ManagedBy   = "Terraform"
    Environment = "dev"
  }
}