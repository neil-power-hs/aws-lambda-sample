resource "aws_lambda_function" "sample_lambda" {

    filename = "../build/distributions/sample-lambda-1.0.0.zip"
  // TODO STEP 7 Comment out the 'filename' line above and uncomment the 's3_bucket' and 's3_key' lines below
//   s3_bucket = "${var.bucket}"
//   s3_key = "sample_lambda/${var.env}/sample-lambda-1.0.0.zip"

  function_name = "sampleLambda_${var.env}"
  description = "A demonstration of AWS Lambda"
  runtime = "java8"

  timeout = 10
  role = "${aws_iam_role.sample_lambda_role.arn}"
  handler = "com.hootsuite.example.lambda.SampleLambda::invokeFunction"
}