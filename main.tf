resource "aws_db_subnet_group" "terraform_SG" {
  name       = var.subnet_group_name
  subnet_ids = var.sub_id

  tags = merge(
    {
      Name = "terraform-SG"
    },
    var.tags
  )
}

resource "aws_db_instance" "terraform_DB" {
  allocated_storage      = 20
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  port                   = var.db_port
  vpc_security_group_ids = var.sg_name
  db_subnet_group_name   = aws_db_subnet_group.terraform_SG.name
  name                   = var.name
  identifier             = var.identifier
  username               = var.username
  password               = "kloudvibe"
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = true

  tags = merge(
    {
      Name = "terraform-DB"
    },
    var.tags
  )
}

output "db_id" {
  value = aws_db_instance.terraform_DB.address
}

output "db_port" {
  value = aws_db_instance.terraform_DB.port
}
