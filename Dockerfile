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

CMD npm start

EXPOSE 8080
