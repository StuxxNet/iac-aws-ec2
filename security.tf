resource "aws_security_group" "this" {
  name        = format("%s_traffic", var.instance_name)
  description = format("Traffic to %s instance", var.instance_name)
  vpc_id      = var.vpc_id

  tags = {
    Name = format("%s_traffic", var.instance_name)
  }
}

resource "aws_security_group_rule" "example" {
  for_each = var.security_group_rules

  type              = each.value.type
  from_port         = each.value.port
  to_port           = each.value.port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr_blocks
  security_group_id = aws_security_group.this.id
}

resource "aws_network_interface" "this" {
  subnet_id   = var.subnet_id
  private_ips = [var.private_ip]
  security_groups = [aws_security_group.this.id]
  tags = {
    Name = format("%s_network_interface", var.instance_name)
  }
}

resource "aws_eip" "public_access" {
  count = var.associate_public_ip_address ? 1 : 0

  vpc                       = true
  network_interface         = aws_network_interface.this.id
}