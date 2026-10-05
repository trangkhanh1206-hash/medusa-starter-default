FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npx medusa build

FROM node:20-alpine

WORKDIR /app

COPY --from=builder /app ./

ENV NODE_ENV=production
EXPOSE 9000

CMD ["npm", "run", "start"]