output "name" {
  description = "Nome gerado de acordo com o padrão"
  value       = local.name
}

output "tags_without_name" {
  description = "Representa todas as tags requeridas, com as adicionais, porém SEM a tag Name e a Application"
  value       = local.tags_without_name
}

output "tags" {
  description = "Representa todas as tags requeridas e com as tags adicionais"
  value       = local.tags
}

output "cloudwatch_log_group_name" {
  description = "Definição de caminho padrão para CloudWatch Log Groups "
  value       = local.cloudwatch_log_group_name
}

output "asg_tags" {
  description = "Tags requeridas para o ambiente Inter no formato para ASG"
  value       = local.asg_tags
}

output "asg_tags_without_name" {
  description = "Tags requeridas para o ambiente Inter sem a tg Name no formato para ASG"
  value       = local.asg_tags_without_name
}
