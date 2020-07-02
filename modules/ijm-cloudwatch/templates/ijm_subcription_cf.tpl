AWSTemplateFormatVersion: 2010-09-09
Description: >-
  This template creates SNS topic subscription with EMail protocol
Resources:
  IJMAlarmTopicSubcription:
    Type: AWS::SNS::Subscription
    Properties: 
        Endpoint: ${TargetEmail}
        Protocol: email
        Region: eu-west-2
        TopicArn: ${TargetTopicARN}


