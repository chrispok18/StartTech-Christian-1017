# StartTech – Runbook (Assessment 3)

## Key endpoints
- Frontend (CloudFront): d1tc3hwh6hz99y.cloudfront.net
- Backend (ALB): starttech-prod-alb-540102761.eu-west-1.elb.amazonaws.com
- Health: http://starttech-prod-alb-540102761.eu-west-1.elb.amazonaws.com/health

## Common checks

### 1) Backend health check
```bash
curl http://starttech-prod-alb-540102761.eu-west-1.elb.amazonaws.com/health
