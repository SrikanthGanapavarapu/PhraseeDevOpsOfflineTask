module "task1" {
  source = "../resource/Task1/"

  aws_id     = ""   ## Add aws_id
  aws_key    = ""   ##Add aws_key
  aws_region = ""   ## Add aws_region

  instance_type  = "t2.small"			## Instance Type
  key_name       = "module1"			## aws key_pair name
  s3_bucket_name = "phrasee-module1-bkt"	## s3_bucket_name

}
