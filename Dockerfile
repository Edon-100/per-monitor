FROM node:alpine AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install

FROM node:alpine AS builder
WORKDIR /app
COPY . .
COPY --from=deps /app/node_modules ./node_modules
RUN npm run build

FROM node:alpine AS runner
WORKDIR /app

ENV NODE_ENV production
ENV PORT 8088
ARG front_env
ENV front_env $front_env

COPY --from=builder /app/bin ./bin
COPY --from=builder /app/build ./build
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

# RUN if [ "$DOCKER_ENV" = "prod" ] ; then  echo   your NODE_ENV for stage is $NODE_ENV;  \
# else  echo your NODE_ENV for dev is $NODE_ENV; \
# fi

EXPOSE ${PORT}

CMD ["npm", "run", "start:prod"] 