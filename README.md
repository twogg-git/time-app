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
- https://devcenter.heroku.com/articles/git#http-git-authentication
- https://devcenter.heroku.com/articles/deploying-nodejs


Heroku sets the PORT, so we have to bind and listens on tcp/80.
```ssh
const port = process.env.PORT || 80
```