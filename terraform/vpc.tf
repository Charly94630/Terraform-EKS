resource "aws_eks_cluster" "staging_eks_cluster" {
  name     = local.clustername
  role_arn = "arn:aws:iam::195400145213:role/LabRole"

  vpc_config {
    subnet_ids         = ["subnet-07473c937c3809cc4", "subnet-079ce72941a946f2a"]
    security_group_ids = ["sg-06816eae0b0dfe36a", "sg-0854cac2c2cbdf5ca"]
  }
}
