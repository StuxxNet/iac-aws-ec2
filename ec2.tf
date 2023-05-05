resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  hibernation = var.enable_hibernation

  instance_profile = var.instance_profile_policy_path != "" ? aws_iam_instance_profile.ec2_profile[0].name : ""

  user_data = var.user_data

  key_name = aws_key_pair.access_key.key_name

  root_block_device {
    volume_size = var.root_volume_size
    kms_key_id = aws_kms_alias.eks.target_key_id
    delete_on_termination = true
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_devices != null ? var.ebs_block_devices : []

    content {
      device_name = ebs_block_device.value.device_name
      volume_size = ebs_block_device.value.volume_size
      encrypted   = true
      kms_key_id  = aws_kms_alias.eks.target_key_id
    }
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