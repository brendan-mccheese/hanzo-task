# React app docker file
# Uses apline as base for smallest image
FROM node:12-alpine

LABEL maintainer="brendan-mcheese"
LABEL purpose="Hanzo SRE task"

WORKDIR /app

# Install deps, done for layer caching purposes
COPY yarn.lock .
COPY package.json .
RUN yarn install

# Copy everything else
COPY . .
RUN chmod +x ./entrypoint.sh

EXPOSE 1234
ENTRYPOINT ["./entrypoint.sh"]