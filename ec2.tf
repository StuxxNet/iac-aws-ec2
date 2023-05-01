resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  hibernation = var.enable_hibernation

  instance_profile = var.instance_profile_policy_path != "" ? aws_iam_instance_profile.ec2_profile[0].name : ""

  user_data = var.user_data

  root_block_device {
    volume_size = var.root_volume_size
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  tags = vars.default_tags

  validation {
    condition     = var.instance_type == "t3.micro" || var.instance_type == "t3.medium" || var.instance_type == "t3.large"
    error_message = "Instance type must be t3.micro, t3.medium or t3.large"
  }
}