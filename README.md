# StartTech Application (AltSchool Cloud Engineering – Assessment 3)

Repo: StartTech-Christian-1017  
This repository contains the full-stack application and CI/CD workflows.

## Stack
- Frontend: React (Create React App) → S3 + CloudFront
- Backend: Golang API → EC2 Auto Scaling Group behind ALB
- Cache: Redis (AWS ElastiCache)
- Database: MongoDB Atlas
- CI/CD: GitHub Actions
- Monitoring: CloudWatch Logs

## Live URLs (eu-west-1)
- CloudFront: d1tc3hwh6hz99y.cloudfront.net
- Backend ALB: starttech-prod-alb-540102761.eu-west-1.elb.amazonaws.com
- Backend Health: http://starttech-prod-alb-540102761.eu-west-1.elb.amazonaws.com/health

## CI/CD Workflows
### Frontend CI/CD
- Path: `.github/workflows/frontend-ci-cd.yml` (already working)
- On push to main (frontend changes):
  - npm ci
  - tests (passWithNoTests)
  - build
  - deploy to S3 bucket: starttech-prod-frontend-033504885956
  - CloudFront invalidation (Distribution ID: EUGAM13FXD12W)

### Backend CI/CD
- Path: `.github/workflows/backend-ci-cd.yml`
- On push to main (backend changes):
  - go test
  - govulncheck security scan (report-only)
  - build linux binary
  - upload to S3:
    - s3://starttech-prod-backend-artifacts-033504885956/backend/app
  - trigger rolling deploy:
    - ASG: starttech-prod-asg

## Scripts
- `scripts/health-check.sh` – checks backend /health
- `scripts/deploy-frontend.sh` – notes that frontend deploy is CI-driven
- `scripts/deploy-backend.sh` – notes that backend deploy is CI-driven
- `scripts/rollback.sh` – rollback guidance

## Documentation
- `ARCHITECTURE.md`
- `RUNBOOK.md`

## Infrastructure
Infrastructure is managed via Terraform in a separate repository:
- `StartTech-infra-Christian-1017`
