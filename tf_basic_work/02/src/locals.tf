locals {
  vm_web_name = "${var.vm_project}-${var.vpc_name}-${var.vm_platform}-${var.vm_web_role}"
  vm_db_name  = "${var.vm_project}-${var.vpc_name}-${var.vm_platform}-${var.vm_db_role}"
}
