variable "aws_account_id" {
  description = "The AWS Account ID number of the account."
  type        = string
}

variable "cloudtrail_name" {
  description = "The name of the trail."
  type        = string
  default     = "cloudtrail-multi-region"
}

variable "cloudtrail_sns_topic_enabled" {
  description = "Specifies whether the trail is delivered to a SNS topic."
  type        = bool
  default     = true
}

variable "cloudtrail_sns_topic_name" {
  description = "The SNS topic linked to the CloudTrail"
  type        = string
  default     = "cloudtrail-multi-region-sns-topic"
}

variable "cloudwatch_logs_enabled" {
  description = "Specifies whether the trail is delivered to CloudWatch Logs."
  type        = bool
  default     = true
}

variable "cloudwatch_logs_group_name" {
  description = "The name of CloudWatch Logs group to which CloudTrail events are delivered."
  type        = string
  default     = "cloudtrail-multi-region"
}

variable "cloudwatch_logs_retention_in_days" {
  description = "Number of days to retain logs for. CIS recommends 365 days.  Possible values are: 0, 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, and 3653. Set to 0 to keep logs indefinitely."
  type        = number
  default     = 365
}

variable "iam_role_name" {
  description = "The name of the IAM Role to be used by CloudTrail to delivery logs to CloudWatch Logs group."
  type        = string
  default     = "CloudTrail-CloudWatch-Delivery-Role"
}

variable "iam_role_policy_name" {
  description = "The name of the IAM Role Policy to be used by CloudTrail to delivery logs to CloudWatch Logs group."
  type        = string
  default     = "CloudTrail-CloudWatch-Delivery-Policy"
}

variable "permissions_boundary_arn" {
  description = "The permissions boundary ARN for all IAM Roles, provisioned by this module"
  type        = string
  default     = ""
}

variable "key_deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days. Defaults to 30 days."
  type        = number
  default     = 10
}

variable "region" {
  description = "The AWS region in which CloudTrail is set up."
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket which will store configuration snapshots."
  type        = string
}

variable "s3_key_prefix" {
  description = "The prefix for the specified S3 bucket."
  type        = string
  default     = ""
}

variable "is_organization_trail" {
  description = "Specifies whether the trail is an AWS Organizations trail. Organization trails log events for the master account and all member accounts. Can only be created in the organization master account."
  type        = bool
  default     = false
}

variable "event_selector_data_resources" {
  description = "List of configuration blocks for data events."
  type = list(object({
    data_resource_type   = string       # Resource type in which you want to log data events. You can specify only the following value: "AWS::S3::Object", "AWS::Lambda::Function" and "AWS::DynamoDB::Table"
    data_resource_values = list(string) # List of ARN strings or partial ARN strings to specify selectors for data audit events over data resources. ARN list is specific to single-valued type. For example, arn:aws:s3:::<bucket name>/ for all objects in a bucket, arn:aws:s3:::<bucket name>/key for specific objects, arn:aws:lambda for all lambda events within an account, arn:aws:lambda:<region>:<account number>:function:<function name> for a specific Lambda function, arn:aws:dynamodb for all DDB events for all tables within an account, or arn:aws:dynamodb:<region>:<account number>:table/<table name> for a specific DynamoDB table.
  }))

  default = [
    {
      data_resource_type   = "AWS::S3::Object"
      data_resource_values = ["arn:aws:s3:::"] # All S3 buckets
    },
    {
      data_resource_type   = "AWS::DynamoDB::Table"
      data_resource_values = ["arn:aws:dynamodb"] # All DynamoDB tables
    },
    {
      data_resource_type   = "AWS::Lambda::Function"
      data_resource_values = ["arn:aws:lambda"] # All lambdas
    },
  ]
}

variable "event_selector_exclude_management_event_sources" {
  description = "A set of event sources to exclude. Valid values include: kms.amazonaws.com and rdsdata.amazonaws.com. include_management_events must be set to true to allow this."
  type        = set(string)
  default     = null
}

variable "event_selector_include_management_events" {
  description = "Whether to include management events for your trail. Defaults to true."
  type        = bool
  default     = true
}

variable "event_selector_read_write_type" {
  description = "Type of events to log. Valid values are ReadOnly, WriteOnly, All. Default value is All"
  type        = string
  default     = "All"
}

variable "tags" {
  description = "Specifies object tags key and value. This applies to all resources created by this module."
  type        = map(string)
  default = {
    "Terraform" = "true"
  }
}

# Use the hack to inject external dependencies from outsite the module.
# See below for more detail.
# https://stackoverflow.com/questions/58275233/terraform-depends-on-with-modules
variable "cloudtrail_depends_on" {
  description = "External resources which should be set up before CloudTrail."
  type        = list(any)
  default     = []
}
