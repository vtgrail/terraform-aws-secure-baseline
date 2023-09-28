# --------------------------------------------------------------------------------------------------
# Glue Baseline
# --------------------------------------------------------------------------------------------------
module "glue_baseline_ap-northeast-1" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.ap-northeast-1
  }
}

module "glue_baseline_ap-northeast-2" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.ap-northeast-2
  }
}

module "glue_baseline_ap-northeast-3" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.ap-northeast-3
  }
}

module "glue_baseline_ap-south-1" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.ap-south-1
  }
}

module "glue_baseline_ap-southeast-1" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.ap-southeast-1
  }
}

module "glue_baseline_ap-southeast-2" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.ap-southeast-2
  }
}

module "glue_baseline_ca-central-1" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.ca-central-1
  }
}

module "glue_baseline_eu-central-1" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.eu-central-1
  }
}

module "glue_baseline_eu-north-1" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.eu-north-1
  }
}

module "glue_baseline_eu-west-1" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.eu-west-1
  }
}

module "glue_baseline_eu-west-2" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.eu-west-2
  }
}

module "glue_baseline_eu-west-3" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.eu-west-3
  }
}

module "glue_baseline_sa-east-1" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.sa-east-1
  }
}

module "glue_baseline_us-east-1" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.us-east-1
  }
}

module "glue_baseline_us-east-2" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.us-east-2
  }
}

module "glue_baseline_us-west-1" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.us-west-1
  }
}

module "glue_baseline_us-west-2" {
  source = "./modules/glue-baseline"

  providers = {
    aws = aws.us-west-2
  }
}
