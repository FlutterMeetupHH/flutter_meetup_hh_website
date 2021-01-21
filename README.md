# Hamburg Flutter and Beyond Website

TBD

## How to update AWS infrastructure?

```
aws cloudformation deploy --stack-name FlutterAndBeyond --template-file ./aws-infrastructure.yml --capabilities CAPABILITY_IAM --parameter-overrides HostedZoneId=XXX AcmCertificateArn=XXX
```
