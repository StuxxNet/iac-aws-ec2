data "aws_iam_policy_document" "instance_profile_assume_role" {
  count = var.instance_profile_policy_path != "" ? 1 : 0

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
  count = var.instance_profile_policy_path != "" ? 1 : 0

  name        = format("%s_instance_profile_policy", var.instance_name)
  description = format("Policy for the instance profile of %s instance", var.instance_name)
  policy      = file(var.instance_profile_policy_path)
}

resource "aws_iam_role" "instance_profile_role" {
  count = var.instance_profile_policy_path != "" ? 1 : 0

  name               = format("%s_instance_profile_role", var.instance_name)
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.instance_profile_assume_role[0].json
}

resource "aws_iam_role_policy_attachment" "instance_profile_policy_attachment" {
  count = var.instance_profile_policy_path != "" ? 1 : 0

  role       = aws_iam_role.instance_profile_role[0].name
  policy_arn = aws_iam_policy.instance_profile_policy[0].arn
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  count = var.instance_profile_policy_path != "" ? 1 : 0

  name = format("%s_instance_profile", var.instance_name)
  role = aws_iam_role.instance_profile_role[0].name
}