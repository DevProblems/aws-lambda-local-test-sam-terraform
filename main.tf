//@author: DevProblems(Sarang Kumar A Tak)

resource "aws_lambda_function" "aws-lambda-local-test-sam-terraform" {
    filename = "${local.lambda_build_path}/${local.lambda_zip_file_name}"
    handler = "main"
    runtime = "go1.x"
    function_name = "aws-lambda-local-test-sam-terraform"
    role = aws_iam_role.iam_for_lambda.arn
    timeout = 30
    depends_on = [
        data.archive_file.zip_lambda
    ]
}

resource "null_resource" "sam_metadata_aws_lambda_function_aws_lambda_local_test_sam_terraform" {
    triggers = {
        resource_name = "aws_lambda_function.aws-lambda-local-test-sam-terraform"
        resource_type = "ZIP_LAMBDA_FUNCTION"
        original_source_code = local.lambda_src_path
        built_output_path = "${local.lambda_build_path}/${local.lambda_zip_file_name}"
    }
    depends_on = [
        data.archive_file.zip_lambda
    ]
}

data "archive_file" "zip_lambda" {
    type = "zip"
    source_file = "./bin/main"
    output_path = "${local.lambda_build_path}/${local.lambda_zip_file_name}"
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"
  assume_role_policy = ""
}

