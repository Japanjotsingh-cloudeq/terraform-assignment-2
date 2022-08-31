output "bucket1" {
  value = { for k, v in var.bucketmap : k => v }

}
output "bucketobj1" {
  value = { for k, v in var.bucketmap2 : k => v }
}
output "ec2count1" {
  value = [for i in var.counttest : i]
}
output "ec2count2" {
  value = [for i in var.countt2 : i]
}

