data "aws_kms_alias" "glue" {
  name = "alias/aws/glue"
}

resource "aws_glue_data_catalog_encryption_settings" "this" {
  data_catalog_encryption_settings {
    connection_password_encryption {
      return_connection_password_encrypted = true
      aws_kms_key_id                       = data.aws_kms_alias.glue.arn
    }

    encryption_at_rest {
      catalog_encryption_mode = "SSE-KMS"
      sse_aws_kms_key_id      = data.aws_kms_alias.glue.arn
    }
  }
}
