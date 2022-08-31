resource "aws_s3_bucket" "jap1" { # s3 bucket #
  for_each = var.bucketmap
  bucket   = each.value ##creating multiple buckets using for_each loop##
  # acl      = "private"            ##  created 3 buckets using for_each with variable type(map) ##

  tags = {
    Name  = each.key
    owner = "japanjot"
  }
}
resource "aws_s3_bucket_object" "test_object" {
  for_each = var.bucketmap
  bucket   = each.value ## Adding a file to multiple buckets using for_each loop ##
  key      = "dc"       ## Added a file to 3 buckets  buckets using for_each loop ##
  source   = "C:\\Users\\Dell\\Documents\\terraform assignment 2\\dc.txt"
}
resource "aws_s3_bucket_object" "test_object1" {
  for_each = var.bucketmap2
  bucket   = "japanjot-bucket2" ## Adding multiple files to a bucket using for_loop ##
  key      = each.key           ## Adding 2 files to a bucket using for_loop ##
  source   = each.value
}
resource "aws_instance" "ctest" {
  count         = length(var.countt2) # count with ec2 #
  ami           = var.countt2[count.index]
  instance_type = "t2.micro" # making different vm image using count#
  #using count with two variables
  tags = {
    Name  = "instance-${count.index + 1}" # made 3 different instance using different AMI by adding it to list varible#
    owner = var.counttest[count.index]
  }
}
data "aws_instance" "my_fi" {

  filter {
    name   = "tag:Name"
    values = ["instance-1"] # data block using  instance  ctest # instance-1
  }
  depends_on = [
    "aws_instance.ctest"
  ]
}
resource "aws_instance" "datatest" {
  ami           = data.aws_instance.my_fi.ami
  instance_type = data.aws_instance.my_fi.instance_type # create instance with using data block #

  tags = {
    name = "jap-datademo"

  }

}