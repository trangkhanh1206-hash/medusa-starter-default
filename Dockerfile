FROM node:22-alpine

WORKDIR /app

COPY package*.json ./
COPY node_modules ./node_modules
COPY .medusa ./.medusa
COPY src ./src
COPY medusa-config.js ./medusa-config.js

ENV NODE_ENV=production
EXPOSE 9000

CMD ["npm", "run", "start"]git add Dockerfile