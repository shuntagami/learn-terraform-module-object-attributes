# Terraform configuration

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      hashicorp-learn = "module-object-attributes"
    }
  }
}

module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website"

  bucket_prefix = "module-object-attributes-"

  files = {
    terraform_managed = true
    www_path          = "${path.root}/www" // Here overrideing default www_path
  }

  tags = {
    terraform     = "true"
    environment   = "dev"
    public-bucket = true
  }
}
