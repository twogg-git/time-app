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
FROM alpine:latest as dependencies

RUN apk add --no-cache nodejs npm

COPY package.json  .
RUN npm install --verbose

FROM alpine:latest

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.docker.cmd="docker run -d -p 8080:8080 --name timeapp"

RUN apk add --no-cache nodejs npm

RUN adduser --system app --home /app
USER app
WORKDIR /app
COPY . /app
COPY --from=dependencies node_modules ./node_modules

CMD npm run main

EXPOSE 8080
