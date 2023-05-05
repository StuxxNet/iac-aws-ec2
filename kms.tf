resource "aws_kms_key" "eks" {
    description     = var.instance_name
}

resource "aws_kms_alias" "eks" {
    name            = format("alias/%s", var.instance_name)
    target_key_id   = aws_kms_key.eks.key_id
}