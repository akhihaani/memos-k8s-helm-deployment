output "memos_public_subnet" {
  value = [for s in aws_subnet.memos_public_subnet : s.id]
}

output "memos_private_subnet" {
  value = [for s in aws_subnet.memos_private_subnet : s.id]
}

output "memos_rds_sg" {
  value = aws_security_group.memos_rds_sg.id
}


output "memos_vpc" {
  value = aws_vpc.memos_vpc.id
}