resource "aws_instance" "this" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  hibernation = var.enable_hibernation

  iam_instance_profile = length(aws_iam_instance_profile.ec2_instance_profile) == 1 ? aws_iam_instance_profile.ec2_instance_profile[0] : null

  user_data = var.user_data

  key_name = aws_key_pair.access_key.key_name

  root_block_device {
    volume_size           = var.root_volume_size
    encrypted             = true
    kms_key_id            = aws_kms_key.this.arn
    delete_on_termination = true
  }

  dynamic "ebs_block_device" {
    for_each = var.ebs_block_devices != null ? var.ebs_block_devices : []

    content {
      device_name = ebs_block_device.value.device_name
      volume_size = ebs_block_device.value.volume_size
      encrypted   = true
      kms_key_id  = aws_kms_key.this.arn
    }
  }

  network_interface {
    network_interface_id = aws_network_interface.this.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  tags = merge({
    Name = var.instance_name
  }, var.default_tags)

}