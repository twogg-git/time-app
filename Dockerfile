# -------------------------------------------------------------------
# Minimal dockerfile from alpine base
#
# Instructions:
# =============
# 1. Create an empty directory and copy this file into it.
#
# 2. Create image with: 
#	docker build --tag timeoff:latest .
#
# 3. Run with: 
#	docker run -d -p 3000:3000 --name alpine_timeoff timeoff
#
# 4. Login to running container (to update config (vi config/app.json): 
#	docker exec -ti --user root alpine_timeoff /bin/sh
# --------------------------------------------------------------------
FROM alpine:latest as dependencies

# ENV PYTHONUNBUFFERED=1
# RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
# RUN python3 -m ensurepip
# RUN pip3 install --no-cache --upgrade pip setuptools

RUN apk add --no-cache nodejs npm

COPY package.json  .
RUN npm install --verbose

FROM alpine:latest

LABEL org.label-schema.schema-version="1.0"
LABEL org.label-schema.docker.cmd="docker run -d -p 3000:3000 --name timeapp"

RUN apk add --no-cache nodejs 

RUN adduser --system app --home /app
USER app
WORKDIR /app
COPY . /app
COPY --from=dependencies node_modules ./node_modules

CMD node bin/hello

EXPOSE 3000
