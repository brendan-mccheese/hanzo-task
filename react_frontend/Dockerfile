FROM node:12

LABEL maintainer="brendan-mcheese"

WORKDIR /app

# Install deps
COPY yarn.lock .
COPY package.json .
RUN yarn install

# Copy everything else
COPY . .
RUN chmod +x ./entrypoint.sh

EXPOSE 1234
ENTRYPOINT ["./entrypoint.sh"]