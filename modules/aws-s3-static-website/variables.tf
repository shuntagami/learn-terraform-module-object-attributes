# Input variable definitions

variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique. Conflicts with `bucket_prefix`."
  type        = string
  default     = null
}

variable "bucket_prefix" {
  description = "Prefix for the s3 bucket name. Conflicts with `bucket_name`."
  type        = string
  default     = null
}

variable "tags" {
  description = "Map of tags to set on the website bucket."
  type        = map(string)
  default     = {}
}

variable "files" {
  description = "Configuration for website files."
  type = object({
    terraform_managed     = bool
    error_document_key    = optional(string, "error.html")
    index_document_suffix = optional(string, "index.html")
    www_path              = optional(string)
  })
}
