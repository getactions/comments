ARG NODE_VERSION=20.12.2
FROM node:${NODE_VERSION}-slim as base

# Copy built application
COPY --link . .

LABEL org.opencontainers.image.source = "https://github.com/getactions/comments"

EXPOSE 3000

CMD [ "yarn", "run", "start" ]
