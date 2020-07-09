output "out_ecr_api_repo_url" {
    value = aws_ecr_repository.ijm_api_repository.repository_url
}

output "out_ecr_journal_repo_url" {
    value = aws_ecr_repository.ijm_journal_repository.repository_url
}

output "out_ecr_web_repo_url" {
    value = aws_ecr_repository.ijm_web_repository.repository_url
}

output "out_ecr_registry_id" {
    value = aws_ecr_repository.ijm_web_repository.registry_id
}