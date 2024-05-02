ARG NODE_VERSION=20.12.2
FROM node:${NODE_VERSION}-slim as distribution

LABEL org.opencontainers.image.source = "https://github.com/getactions/comments"

ENV NODE_ENV="production"

# Install curl for healthcheck
RUN apt update && apt install curl -y

WORKDIR /app

# Copy built application
COPY . .

RUN yarn install --frozen-lockfile --production=true

RUN chown -R node:node /app

USER node

EXPOSE 3000

CMD [ "yarn", "run", "start" ]
