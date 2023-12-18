resource "aws_efs_file_system" "staging1-clusterEFS" {
  creation_token  = "staging1-clusterEFS"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"

  tags = {
    Name = "staging1-clusterEFS"
  }
}

resource "aws_efs_mount_target" "efs1" {
  file_system_id = aws_efs_file_system.staging1-clusterEFS.id
  subnet_id      = "subnet-07473c937c3809cc4"  
  security_groups = ["sg-0854cac2c2cbdf5ca"]
}

resource "aws_efs_mount_target" "efs2" {
  file_system_id = aws_efs_file_system.staging1-clusterEFS.id
  subnet_id      = "subnet-079ce72941a946f2a"  
  security_groups = ["sg-06816eae0b0dfe36a"]
}