terraform {
  backend "s3" {
    bucket = "japanjot-demo15"
    key    = "new.tfstate"
    region = "us-east-1"
    dynamodb_table = "japanjot-demo1598"
   }
 }