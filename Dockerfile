ARG NODE_VERSION=20.12.2
FROM node:${NODE_VERSION}-slim as base

# Copy built application
COPY --link . .

# Install curl for healthcheck
RUN apt update && apt install curl -y

LABEL org.opencontainers.image.source = "https://github.com/getactions/comments"

EXPOSE 3000

USER node

CMD [ "yarn", "run", "start" ]
