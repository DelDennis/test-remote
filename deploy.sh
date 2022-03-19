
Create S3 bucket + Add versioning

aws s3 sync . s3://eks-gitops

Add github token to secrets manager
'{{resolve:secretsmanager:/throwaway/slightlyunsecured/ghdemotoken:SecretString:GHToken}}'

Build all services and deploy to ECR

aws cloudformation deploy --stack-name EKS-Gitops --template-file ./master.yaml --parameter-overrides file://config/config.json --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND CAPABILITY_NAMED_IAM --region us-west-1
