resource "aws_kms_key" "this" {
  description = var.instance_name
}

resource "aws_kms_alias" "this" {
  name          = format("alias/%s", var.instance_name)
  target_key_id = aws_kms_key.this.key_id
} 