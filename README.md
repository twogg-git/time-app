# time-app

https://devcenter.heroku.com/articles/git#http-git-authentication

https://devcenter.heroku.com/articles/deploying-nodejs


Heroku sets the PORT, so we have to bind and listens on tcp/80.
```ssh
const port = process.env.PORT || 80
```


# -------------------------------------------------------------------
# Minimal dockerfile from alpine base
#
# Instructions:
# =============
# 1. Create an empty directory and copy this file into it.
#
# 2. Create image with: 
#	docker build --tag timeapp:v1 .
#
# 3. Run with: 
#	docker run -d -p 3000:3000 --name timeapp timeapp
#
# 4. Login to running container (to update config (vi config/app.json): 
#	docker exec -ti --user root timeapp /bin/sh
# --------------------------------------------------------------------

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