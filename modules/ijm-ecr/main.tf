data "template_file" "ecr_policy_tmpl" {
    template = "${file("modules/ijm-ecr/templates/ecr_policy.json.tpl")}"
}


resource "aws_ecr_repository" "ijm_api_repository" {
    name                    = "ijm-api"
    image_tag_mutability    = "IMMUTABLE"
    image_scanning_configuration {
        scan_on_push = true
    }
}

resource "aws_ecr_lifecycle_policy" "ijm_api_policy" {
    repository = aws_ecr_repository.ijm_api_repository.name
    policy       = data.template_file.ecr_policy_tmpl.rendered
}

resource "aws_ecr_repository" "ijm_journal_repository" {
    name                    = "ijm-journal"
    image_tag_mutability    = "IMMUTABLE"
    image_scanning_configuration {
        scan_on_push = true
    }
}

resource "aws_ecr_lifecycle_policy" "ijm_journal_policy" {
    repository = aws_ecr_repository.ijm_journal_repository.name
    policy       = data.template_file.ecr_policy_tmpl.rendered
}

resource "aws_ecr_repository" "ijm_web_repository" {
    name                    = "ijm-web"
    image_tag_mutability    = "IMMUTABLE"
    image_scanning_configuration {
        scan_on_push = true
    }
}

resource "aws_ecr_lifecycle_policy" "ijm_web_policy" {
    repository = aws_ecr_repository.ijm_web_repository.name
    policy       = data.template_file.ecr_policy_tmpl.rendered
}