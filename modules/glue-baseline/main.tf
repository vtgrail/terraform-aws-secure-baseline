resource "aws_glue_data_catalog_encryption_settings" "this" {
  data_catalog_encryption_settings {
    connection_password_encryption {
      return_connection_password_encrypted = true
      aws_kms_key_id                       = "alias/aws/glue"
    }

    encryption_at_rest {
      catalog_encryption_mode = "SSE-KMS"
      se_aws_kms_key_id       = "alias/aws/glue"
    }
  }
}
