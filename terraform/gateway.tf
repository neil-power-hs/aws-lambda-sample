//// TODO Uncomment to create API Gateway
//
//resource "aws_api_gateway_rest_api" "sample_lambda_api" {
//  name = "sample_lambda_api_${var.env}"
//  description = "A gateway to use a lambda function to convert Twitter Search string to JSON model and vice versa."
//}
//
//resource "aws_api_gateway_resource" "sample_lambda_resource" {
//  rest_api_id = "${aws_api_gateway_rest_api.sample_lambda_api.id}"
//  parent_id = "${aws_api_gateway_rest_api.sample_lambda_api.root_resource_id}"
//  path_part = "sample_lambda"
//}
//
//resource "aws_api_gateway_method" "sample_lambda_post" {
//  rest_api_id = "${aws_api_gateway_rest_api.sample_lambda_api.id}"
//  resource_id = "${aws_api_gateway_resource.sample_lambda_resource.id}"
//
//  http_method = "POST"
//  authorization = "NONE"
//}
//
//resource "aws_api_gateway_method_response" "sample_lambda_post_200" {
//  rest_api_id = "${aws_api_gateway_rest_api.sample_lambda_api.id}"
//  resource_id = "${aws_api_gateway_resource.sample_lambda_resource.id}"
//  http_method = "${aws_api_gateway_method.sample_lambda_post.http_method}"
//  status_code = "200"
//}
//
//resource "aws_api_gateway_integration" "sample_lambda_integration" {
//  rest_api_id = "${aws_api_gateway_rest_api.sample_lambda_api.id}"
//  resource_id = "${aws_api_gateway_resource.sample_lambda_resource.id}"
//  http_method = "${aws_api_gateway_method.sample_lambda_post.http_method}"
//  integration_http_method = "POST"
//
//  type = "AWS"
//  uri = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${aws_lambda_function.sample_lambda.arn}/invocations"
//}
//
//resource "aws_api_gateway_integration_response" "sample_lambda_integration_response" {
//  rest_api_id = "${aws_api_gateway_rest_api.sample_lambda_api.id}"
//  resource_id = "${aws_api_gateway_resource.sample_lambda_resource.id}"
//  http_method = "${aws_api_gateway_method.sample_lambda_post.http_method}"
//  status_code = "${aws_api_gateway_method_response.sample_lambda_post_200.status_code}"
//
//}
//
//resource "aws_api_gateway_model" "sample_lambda_model" {
//  rest_api_id = "${aws_api_gateway_rest_api.sample_lambda_api.id}"
//  name = "sampleLambdaModel"
//  description = "Schema for input to Query Builder Lambda Function"
//  content_type = "application/json"
//
//  schema = <<EOF
//{
//  "$schema" : "http://json-schema.org/draft-04/schema#",
//  "title" : "Request Schema",
//  "type" : "object"
//}
//EOF
//}
//
//# Basic deployment and permission for hitting $LATEST of Lambda function
//
//resource "aws_api_gateway_deployment" "sample_lambda_deployment" {
//  depends_on = [
//    "aws_api_gateway_method.sample_lambda_post",
//    "aws_api_gateway_integration.sample_lambda_integration",
//    "aws_api_gateway_integration_response.sample_lambda_integration_response",
//    "aws_api_gateway_method_response.sample_lambda_post_200"
//  ]
//
//  rest_api_id = "${aws_api_gateway_rest_api.sample_lambda_api.id}"
//  stage_name = "${var.env}"
//
//  # forces a new deployment each run
//  stage_description = "${timestamp()}"
//}
//
//resource "aws_lambda_permission" "sample_lambda_permission" {
//  statement_id = "AllowExecutionFromAPIGateway"
//  action = "lambda:InvokeFunction"
//  function_name = "${aws_lambda_function.sample_lambda.arn}"
//  principal = "apigateway.amazonaws.com"
//
//  source_arn = "arn:aws:execute-api:${var.region}:${var.account}:${aws_api_gateway_rest_api.sample_lambda_api.id}/*/*/*"
//}
