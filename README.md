# time-app

https://twogg-timeapp.herokuapp.com/


Create image with: 
```ssh
docker build --tag timeapp:v1 .
```

Run with: 
```ssh
docker run -d -p 80:80 --name timeapp timeapp:v1
```

Login to running container 
```ssh
docker exec -ti --user root timeapp /bin/sh
```

Heroku deployment documentation:
https://devcenter.heroku.com/articles/git#http-git-authentication
https://devcenter.heroku.com/articles/deploying-nodejs


CircleCI
https://circleci.com/blog/orbs-aws-ecr/
https://circleci.com/blog/aws-ecr-auth-support/

Terraform 
https://gmusumeci.medium.com/how-to-deploy-aws-ecs-fargate-containers-step-by-step-using-terraform-545eeac743be
https://www.chakray.com/creating-fargate-ecs-task-aws-using-terraform/
https://github.com/guillermo-musumeci/terraform-ecs-fargate

Heroku sets the PORT, so we have to bind and listens on tcp/80.
```ssh
const port = process.env.PORT || 80
```