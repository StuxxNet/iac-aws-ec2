resource "aws_key_pair" "access_key" {
  key_name   = format("%s_access_key", var.instance_name)
  public_key = var.public_access_key
}