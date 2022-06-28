resource "aws_glue_data_catalog_encryption_settings" "this" {
  data_catalog_encryption_settings {
    connection_password_encryption {
      return_connection_password_encrypted = true
    }

    encryption_at_rest {
      catalog_encryption_mode = "SSE-KMS"
    }
  }

  lifecycle {
    ignore_changes = [
      data_catalog_encryption_settings[0].connection_password_encryption[0].aws_kms_key_id,
      data_catalog_encryption_settings[0].encryption_at_rest[0].sse_aws_kms_key_id,
    ]
  }
}
