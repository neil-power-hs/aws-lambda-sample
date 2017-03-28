resource "aws_iam_user" "sample_lambda_jenkins" {
  name = "sample_lambda_jenkins_${var.env}"
}

resource "aws_iam_access_key" "sample_lambda_jenkins" {
  user = "${aws_iam_user.sample_lambda_jenkins.name}"
}

resource "aws_iam_user_policy" "sample_lambda_jenkins" {
  name = "sample-lambda-jenkins"
  user = "${aws_iam_user.sample_lambda_jenkins.name}"
  policy = "${data.template_file.jenkins_user_policy.rendered}"
}

data "template_file" "jenkins_user_policy" {
  template = "${file("templates/iam_jenkins_user_policy.json.hcl.tpl")}"
  vars {
    env = "${var.env}"
    bucket = "${var.bucket}"
  }
}
