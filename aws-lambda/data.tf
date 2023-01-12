resource "null_resource" "install_python_dependencies" {
  provisioner "local-exec" {
    command = "bash ${path.module}/create_pkg.sh"
  }
}

data "archive_file" "lambda_function_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda-dist"
  output_path = "${path.module}/lambda-dist/handler.zip"
  excludes = [
    "venv",
    "__pycache__"
  ]

  depends_on = [
    null_resource.install_python_dependencies
  ]
}
