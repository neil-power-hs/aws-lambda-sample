resource "aws_iam_user" "sample_lambda_invoker" {
  name = "sample_lambda_invoker_${var.env}"
}

resource "aws_iam_access_key" "sample_lambda_invoker" {
  user = "${aws_iam_user.sample_lambda_invoker.name}"
}

resource "aws_iam_user_policy" "sample_lambda_invoker" {
  name = "sample_lambda_invocation"
  user = "${aws_iam_user.sample_lambda_invoker.name}"
  policy = "${data.template_file.lambda_invoker_policy.rendered}"
}

data "template_file" "lambda_invoker_policy" {
  template = "${file("templates/iam_lambda_invoker_user_policy.json.hcl.tpl")}"
  vars {
    env = "${var.env}"
    region = "${var.region}"
    account = "${var.account}"
  }
}