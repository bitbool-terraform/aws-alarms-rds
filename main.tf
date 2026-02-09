resource "aws_cloudwatch_metric_alarm" "rds" {
  for_each =  toset(var.create_alarms)

  alarm_name        = format("%s-%s",var.prefix,each.key)
  alarm_description = format("RDS %s for %s",each.key,var.description)

  comparison_operator       = var.metrics[each.key].comparison_operator
  evaluation_periods        = try(var.evaluation_periods[each.key],var.default_evaluation_periods)
  threshold                 = try(var.threshold[each.key],var.default_threshold[each.key])*var.metrics[each.key].threshold_multiplier
  datapoints_to_alarm       = try(var.datapoints_to_alarm[each.key],var.default_datapoints_to_alarm)  

  metric_name = var.metrics[each.key].metric_name
  namespace   = var.metrics[each.key].namespace
  period      = try(var.period[each.key],var.default_period)
  statistic   = var.metrics[each.key].stat
  unit        = var.metrics[each.key].unit

  dimensions = {
    DBInstanceIdentifier = var.DBInstanceIdentifier 
  }

  alarm_actions             = coalesce(var.alarm_actions,var.actions)
  ok_actions                = coalesce(var.ok_actions,var.actions)
  insufficient_data_actions = coalesce(var.insufficient_data_actions,var.actions)

  treat_missing_data = var.metrics[each.key].treat_missing_data
}


