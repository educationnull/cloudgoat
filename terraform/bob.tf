resource "aws_iam_user" "bob" {
  name = "bob"
}

resource "aws_iam_access_key" "bob_key" {
  user = "${aws_iam_user.bob.name}"
}

resource "aws_iam_user_policy" "bob_policy" {
  name = "bob_policy"
  user = "${aws_iam_user.bob.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:AllocateAddress",
        "ec2:AttachVolume",
        "ec2:CreateDhcpOptions",
        "ec2:CreateFlowLogs",
        "ec2:CreateImage",
        "ec2:CreateRoute",
        "ec2:DescribeInstances",
        "ec2:DescribeInstanceAttribute",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeSubnets",
        "ec2:DescribeVolumes",
        "ec2:DescribeVpcs",
        "ec2:GetConsoleOutput",
        "ec2:GetConsoleScreenshot",
        "ec2:GetPasswordData",
        "ec2:ModifyInstanceAttribute",
        "ec2:RebootInstances",
        "ec2:StartInstances",
        "ec2:StopInstances"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
