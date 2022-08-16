locals {
  user_data = <<-EOT
  #!/bin/bash
  echo "Hello Terraform!"
  EOT
}

module "ec2_instance" {
  source = "../../"

  name = "single-instance"

  ami                         = "ami-090fa75af13c156b4"
  instance_type               = "c5.4xlarge"
  key_name                    = "teste-ec2"
  availability_zone           = "us-east-1c"
  vpc_security_group_ids      = ["sg-055ae74da00e6bb54"]
  subnet_id                   = "subnet-05c3f49ee1ba9ff2f"
  associate_public_ip_address = true
  disable_api_stop            = false

  hibernation = true

  user_data_base64            = base64encode(local.user_data)
  user_data_replace_on_change = true

  cpu_core_count       = 2
  cpu_threads_per_core = 1

  enable_volume_tags = false
  root_block_device = [
    {
      encrypted   = true
      volume_type = "gp3"
      throughput  = 200
      volume_size = 50
      tags = {
        ManagedBy = "Terraform"
        Name = "my-root-block"
      }
    },
  ]

  ebs_block_device = [
    {
      device_name = "/dev/sdf"
      volume_type = "gp3"
      volume_size = 5
      throughput  = 200
      encrypted   = true
    }
  ]
}