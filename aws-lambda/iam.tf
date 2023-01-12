resource "aws_iam_role" "lambda_test_role" {
  name               = "lambda-test-role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Effect": "Allow"
        }
    ]
}
EOF
}

resource "aws_iam_policy" "lambda_test_policy" {
  name = "lambda-test-policy"
  description = "Lambda test policy"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:*"
            ],
            "Resource": "arn:aws:s3:::search-service-solr-response",
            "Effect": "Allow"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_test_policy_attachment" {
  role = aws_iam_role.lambda_test_role.name
  policy_arn = aws_iam_policy.lambda_test_policy.arn

  depends_on = [
    aws_iam_role.lambda_test_role,
    aws_iam_policy.lambda_test_policy
  ]
}
