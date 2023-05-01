data "aws_iam_policy_document" "instance_profile_assume_role" {
  count = var.instance_profile_policy_path ? 1 : 0

  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_policy" "instance_profile_policy" {
  count = var.instance_profile_policy_path ? 1 : 0

  name        = format("%s_instance_profile_policy", aws_instance.this.id)
  description = format("Policy for the instance profile of %s instance", aws_instance.this.id)
  policy      = file(var.instance_profile_policy)
}

resource "aws_iam_role" "instance_profile_role" {
  count = var.instance_profile_policy_path ? 1 : 0

  name               = format("%s_instance_profile_role", aws_instance.this.id)
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.instance_profile_assume_role[0].json
  policy             = aws_iam_policy.instance_profile_policy[0].arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  count = var.instance_profile_policy_path ? 1 : 0

  name = format("%s_profile", aws_instance.this.id)
  role = aws_iam_role.instance_profile_role[0].name
}