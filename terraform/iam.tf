resource "aws_iam_role" "sample_lambda_role" {
    name = "sample-lambda-role-${var.env}"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

data "template_file" "sample_lambda_policy" {
  template = "${file("templates/iam_sample_lambda_policy.json.hcl.tpl")}"
}

resource "aws_iam_role_policy" "sample_lambda_policy" {
  name = "sample-lambda-policy-${var.env}"
  role = "${aws_iam_role.sample_lambda_role.id}"
  policy = "${data.template_file.sample_lambda_policy.rendered}"
}

