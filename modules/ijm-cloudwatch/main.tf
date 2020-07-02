/* Configuration for SNS topic, subcription and alarams */

resource "aws_sns_topic" "ijm_alarm_topic" {
    name         = "IJM-ALARM-TOPIC"
    display_name = "IJM Alarm Topic"
}

data "template_file" "ijm_subcription_cf_template" {
    template    = "${file("modules/ijm-cloudwatch/templates/ijm_subcription_cf.tpl")}"
    vars        = {
        TargetEmail     = var.ijm_alarm_email
        TargetTopicARN  = aws_sns_topic.ijm_alarm_topic.arn
    }
}

resource "aws_cloudformation_stack" "ijm_topic_subscription" {
    name            = "ijm-topic-subcription-stack"
    template_body   = data.template_file.ijm_subcription_cf_template.rendered
}

resource "aws_cloudwatch_metric_alarm" "ijm_site_down_alarm" {
    alarm_name          = "IJM-Site-Down-Alarm"

    namespace           = "AWS/ApplicationELB"
    metric_name         = "HealthyHostCount"
    comparison_operator = "LessThanThreshold"
    threshold           = "1"
    statistic           = "Average"
    period              = "180"
    evaluation_periods  = "1"

    alarm_description   = "IJM site stopped responding on Heath Checks"
    actions_enabled     = "true"
    alarm_actions       = [aws_sns_topic.ijm_alarm_topic.arn]
    dimensions = {
        TargetGroup  = var.alb_tg_arn_suf
        LoadBalancer = var.alb_arn_suf
    }
}