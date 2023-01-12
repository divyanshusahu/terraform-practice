resource "aws_lambda_function" "lambda_test_function" {
  function_name = "lambda-test-function"
  filename      = data.archive_file.lambda_function_zip.output_path
  description   = "This function prints S3 bucket cors"
  role          = aws_iam_role.lambda_test_role.arn
  handler       = "handler.handler"
  runtime       = "python3.9"
  memory_size   = 512
  timeout       = 300

  source_code_hash = data.archive_file.lambda_function_zip.output_base64sha256

  depends_on = [
    aws_iam_role.lambda_test_role,
    data.archive_file.lambda_function_zip
  ]
}
