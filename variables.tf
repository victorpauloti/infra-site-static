variable "region" {
  type        = string
  description = "Bucket for static site"
}

variable "profile" {
  type        = string
  description = "Accontu AWS"

}

variable "bucket_name" {
  type        = string
  description = "Name Bucket"

}


variable "tags" {
  type        = map(string)
  description = "Tags for Resources"
  default = {
    
  }

}