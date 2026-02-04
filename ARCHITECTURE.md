# StartTech – Architecture (Assessment 3)

## Region
- AWS Region: eu-west-1 (Ireland)

## High-level architecture
- Frontend: React (Create React App) deployed to S3 and served globally via CloudFront
- Backend: Golang API running on EC2 Auto Scaling Group (private subnets) behind an Application Load Balancer (ALB)
- Cache: Redis on AWS ElastiCache
- Database: MongoDB Atlas
- IaC: Terraform (separate infrastructure repo)
- CI/CD: GitHub Actions (frontend + backend)
- Monitoring: CloudWatch Logs + ALB health checks

## Traffic flow
1. User visits CloudFront distribution:
   - CloudFront domain: d1tc3hwh6hz99y.cloudfront.net
2. CloudFront serves static React assets from S3:
   - S3 bucket: starttech-prod-frontend-033504885956
3. Frontend calls backend via ALB:
   - ALB DNS: starttech-prod-alb-540102761.eu-west-1.elb.amazonaws.com
4. ALB forwards requests to EC2 instances in ASG on port 8080
5. Backend uses:
   - Redis (ElastiCache) for caching/sessions
   - MongoDB Atlas for persistence

## Backend runtime
- Backend listens on port: 8080
- Health endpoint: /health
- Deployment mechanism:
  - GitHub Actions builds a Linux binary
  - Uploads artifact to S3:
    - s3://starttech-prod-backend-artifacts-033504885956/backend/app
  - Triggers ASG instance refresh for rolling deployment
  - EC2 user_data downloads artifact from S3 and starts a systemd service

## Monitoring
- CloudWatch Log Group:
  - /starttech/prod/backend
- Logs include backend startup lines and cloud-init logs.
