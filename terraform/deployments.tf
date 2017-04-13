////TODO Uncomment to create stage for invoking SAMPLE_LAMBDA alias
//
//# SAMPLE_LAMBDA Alias
//
//resource "aws_api_gateway_deployment" "sample_lambda_deployment_SAMPLE_LAMBDA" {
//  depends_on = ["aws_api_gateway_integration.query_builder_integration"]
//
//  rest_api_id = "${aws_api_gateway_rest_api.sample_lambda_api.id}"
//  stage_name = "alias-example"
//
//  variables {
//    "lambdaAlias" = "SAMPLE_LAMBDA"
//  }
//
//  # forces a new deployment each run
//  stage_description = "${timestamp()}"
//}
//
//resource "aws_lambda_permission" "sample_lambda_permission_SAMPLE_LAMBDA" {
//  statement_id = "AllowExecutionFromAPIGateway"
//  action = "lambda:InvokeFunction"
//  function_name = "${aws_lambda_function.sample_lambda.arn}"
//  principal = "apigateway.amazonaws.com"
//
//  source_arn = "arn:aws:execute-api:${var.region}:${var.account}:${aws_api_gateway_rest_api.sample_lambda_api.id}/*/*/*"
//
//  qualifier = "SAMPLE_LAMBDA"
//}